class PhoneNumbersController < ApplicationController
  def create
    cleaned_number = clean_phone_number(params[:phone_number][:number])
    @phone_number = PhoneNumber.find_or_create_by(number: cleaned_number)
    if @phone_number.verified?
      redirect_to root_url, notice: "Your number has been verified, and you will receive our updates"
    else
      send_verification_text(@phone_number)
      redirect_to root_url, alert: "We have sent a text message to the number provided.  Please verify your number by replying 'START'"
    end
  end

  private

  def send_verification_text(phone_number)
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILO_TOKEN'])
    client.account.sms.messages.create(
      from: ENV['TWILO_FROM'],
      to: phone_number,
      body: "Thanks for signing up to receive Thrive updates. Please verify your number by replying START to this message."
      )
  end

  def clean_phone_number(dirty_number)
    cleaned_number = dirty_number.gsub(/\D/, '')
    if cleaned_number.start_with? '1'
      cleaned_number
    else
      "1#{cleaned_number}"
    end
  end
end
