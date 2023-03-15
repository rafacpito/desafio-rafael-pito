class CitizenMailer < ApplicationMailer
  def new_citizen_email
    @citizen = params[:citizen]
    @address = @citizen.address

    mail(to: @citizen.email, subject: "Você foi cadastrado como munícipe no sistema OM30.")
  end

  def update_citizen_status_email
    @citizen = params[:citizen]

    mail(to: @citizen.email, subject: "Seu status foi alterado no sistema OM30.")
  end
end
