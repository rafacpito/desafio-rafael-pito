class Address < ApplicationRecord
  belongs_to :citizen

  BR_STATES = ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA',
               'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO']

  with_options presence: true do
    validates :postal_code, length: { is: 8 }
    validates :street
    validates :neighborhood
    validates :city
    validates :state, inclusion: BR_STATES
  end

  before_validation :unmask_postal_code

  def unmask_postal_code
    return if self.postal_code.nil?

    self.postal_code = self.postal_code.gsub('-', '')
  end
end
  