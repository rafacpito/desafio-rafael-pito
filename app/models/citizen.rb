require "cpf_cnpj"

class Citizen < ApplicationRecord
  has_one :address
  mount_uploader :photo, PhotoUploader
  accepts_nested_attributes_for :address

  with_options presence: true do
    validates :full_name
    validates :cpf, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
    validates :cns, length: { is: 15 }, numericality: { only_integer: true }
    validates :email, email: true
    validates :telephone, length: { minimum: 12, maximum: 15 }
    validates :birth_date
    validates :photo
  end

  validate :validate_date
  validate :validate_cns
  validate :validate_cpf
  before_validation :unmask_cpf_cns_and_telephone

  after_commit :send_status_updated_email, on: [:update], if: :saved_change_to_status?

  def validate_date
    return if birth_date.blank?

    if birth_date > Date.today || birth_date < Date.today - 120.years
      errors.add(:birth_date, 'inválida.')
    end
  end

  def validate_cns
    return if cns.blank?

    if cns.match(/[1-2][0-9]{10}00[0-1][0-9]/) || cns.match(/[7-9][0-9]{14}/)
      if weighted_sum % 11 != 0
        errors.add(:cns, 'inválido.')
      end
    end
  end
  
  def weighted_sum
    sum = 0

    cns.chars.each_with_index do |num, index|
      sum += num.to_i * (15 - index)
    end

    return sum
  end

  def validate_cpf
    return if cpf.blank? || CPF.valid?(cpf)

    errors.add(:cpf, 'inválido.')
  end
  
  def unmask_cpf_cns_and_telephone
    return if self.cpf.nil? || self.cns.nil? || self.telephone.nil?
    
    self.cpf = self.cpf.gsub(/[.-]/, '')
    self.cns = self.cns.gsub(' ', '')
    self.telephone = self.telephone.gsub(/[+-]/, '').gsub(' ', '')
  end

  def send_status_updated_email
    CitizenMailer.with(citizen: self).update_citizen_status_email.deliver_later
    if Rails.env == "production"
      TwilioTextMessenger.send_sms("Status do munícipe cadastrado com esse telefone alterado de #{self.status ? 'Inativo' : 'Ativo'} \
                                  para #{self.status ? 'Ativo' : 'Inativo'}", self.telephone)
    end
  end
end
