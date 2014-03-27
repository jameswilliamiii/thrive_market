class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :incoming_text
  def incoming_text
    message_from_twilio = params['Body']
    cleaned_number = clean_phone_number(params['From'])
    if message_from_twilio.downcase == 'stop'
      PhoneNumber.find_by_number(cleaned_number).update_attributes(verified: false)
      render 'stop.xml.erb', :content_type => 'text/xml'
    elsif message_from_twilio.downcase == 'start'
      phone_number = PhoneNumber.find_or_create_by_number(cleaned_number)
      phone_number.verified = true
      phone_number.save
      render 'verified.xml.erb', :content_type => 'text/xml'
    else
      phone_number = PhoneNumber.find_or_create_by_number(cleaned_number)
      SurveyItem.create(message: message_from_twilio, phone_number: phone_number, from_city: params['FromCity'], from_state: params['FromState'])
      render 'thanks.xml.erb', :content_type => 'text/xml'
    end
  end
end
