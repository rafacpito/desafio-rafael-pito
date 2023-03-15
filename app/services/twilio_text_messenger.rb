class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials.twilio_phone_number,
      to: '+5514998376323',
      body: message
    })
  end
end