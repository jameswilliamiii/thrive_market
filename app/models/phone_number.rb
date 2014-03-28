class PhoneNumber < ActiveRecord::Base
  default_scope { order('created_at desc') }

  scope :verified, -> { where(verified: true).order('created_at desc') }

  def send_update(content)
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILO_TOKEN'])
    client.account.sms.messages.create(
      from: ENV['TWILO_FROM'],
      to: self.number,
      body: content + " You can reply STOP to be removed from these texts."
      )
    rescue Twilio::REST::RequestError => e
      puts "ERROR: #{e.message}, #{self.number}"
  end
end
