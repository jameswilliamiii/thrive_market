class StaticPagesController < ApplicationController
  def home
    @phone_number = PhoneNumber.new
    @survey_item = SurveyItem.new
    session[:survey_seen] = Time.now
  end

  def thanks
    redirect_to root_url, notice: "Thank you, we will get back to you as soon as possible."
  end
end
