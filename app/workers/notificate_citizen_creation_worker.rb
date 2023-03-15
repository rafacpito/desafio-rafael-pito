
class NotificateCitizenCreationWorker
  include Sidekiq::Worker

  def perform(citizen_id)
    citizen = Citizen.find(citizen_id)

    CitizenMailer.with(citizen: citizen).new_citizen_email.deliver_now
    TwilioTextMessenger.send_sms("Munícipe criado no sistema OM30 com esse número de telefone")
  end
end