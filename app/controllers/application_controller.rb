class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def clean_phone_number(dirty_number)
    cleaned_number = dirty_number.gsub(/\D/, '')
    if cleaned_number.start_with? '1'
      cleaned_number
    else
      "1#{cleaned_number}"
    end
  end

  def require_login
    unless signed_in?
      redirect_to sign_in_url, alert: "You must be signed in to access this section."
    end
  end

  def signed_in?
    session[:user].present?
  end

end
