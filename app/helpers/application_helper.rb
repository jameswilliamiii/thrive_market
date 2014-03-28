module ApplicationHelper
  def home?
    params[:action] == "home"
  end
end
