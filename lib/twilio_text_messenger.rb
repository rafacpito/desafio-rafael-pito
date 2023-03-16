module TwilioTextMessenger
  def self.send_sms(message, telephone)
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials.twilio_phone_number,
      to: telephone,
      body: message
    })
  end
end