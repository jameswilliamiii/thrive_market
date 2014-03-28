class SurveyItemsController < ApplicationController

  def create
    @survey_item = SurveyItem.new survey_item_params
    if @survey_item.save
      redirect_to root_url, notice: "Thanks for your feedback!"
    else
      redirect_to root_url, alert: "Sorry, something went wrong."
    end
  end

  private
  def survey_item_params
    params.require(:survey_item).permit(:message, :phone_number)
  end
end
