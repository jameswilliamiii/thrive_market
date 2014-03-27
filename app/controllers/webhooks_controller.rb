class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :incoming_text

  def incoming_text
    message_from_twilio = params['Body']
    cleaned_number = clean_phone_number(params['From'])
    if message_from_twilio.downcase == 'stop'
      PhoneNumber.find_by_number(cleaned_number).update_attributes(verified: false)
      render 'stop.xml.erb', :content_type => 'text/xml'
    elsif message_from_twilio.downcase == 'start'
      create_verified_phone_number(cleaned_number)
      render 'verified.xml.erb', :content_type => 'text/xml'
    else
      create_verified_phone_number(cleaned_number)
      SurveyItem.create(message: message_from_twilio, phone_number: cleaned_number, from_city: params['FromCity'], from_state: params['FromState'])
      render 'thanks.xml.erb', :content_type => 'text/xml'
    end
  end

  private

  def create_verified_phone_number(phone_number)
    new_phone_number = PhoneNumber.find_or_create_by_number(cleaned_number)
    new_phone_number.verified = true
    new_phone_number.save
  end

end
