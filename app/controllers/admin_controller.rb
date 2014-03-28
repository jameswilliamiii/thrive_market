class AdminController < ApplicationController

  before_action :require_login

  def index
    @update = Update.new
  end

  def survey_items
    @survey_items = SurveyItem.page  params[:page]
  end

  def phone_numbers
    @phone_numbers = PhoneNumber.page  params[:page]
  end

  def updates
    @updates = Update.page  params[:page]
  end

end
