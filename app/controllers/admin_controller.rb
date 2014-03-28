class AdminController < ApplicationController

  before_action :require_login

  def index
    @update = Update.new
  end

  def survey_items
  end

  def phone_numbers
  end

end
