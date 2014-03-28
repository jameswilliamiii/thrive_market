class AdminController < ApplicationController

  before_action :require_login

  def index
    @update = Update.new
  end

  def survey_items
    @survey_items = SurveyItem.all
  end

  def phone_numbers
    @phone_numbers = PhoneNumber.all
  end

  def updates
    @updates = Update.all
  end

end
