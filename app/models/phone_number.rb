class PhoneNumber < ActiveRecord::Base

  scope :verified, -> { where(verified: true) }

  def send_update(content)
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILO_TOKEN'])
    client.account.sms.messages.create(
      from: ENV['TWILO_FROM'],
      to: self.number,
      body: content + " You can reply STOP to be removed from these texts."
      )
  end
end
