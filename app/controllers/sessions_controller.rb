class SessionsController < ApplicationController
  def new
  end

  def create
    if user_authenticated?
      session[:user] = thrive_admin
      redirect_to admin_url, notice: "You are now logged in!"
    else
      redirect_to sign_in_url, alert: "You entered an incorrect username or password!"
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_url, notice: "You are now logged out!"
  end

  private

  def user_authenticated?
    params[:username] == ENV['ADMIN_USERNAME'] && params[:password] == ENV['ADMIN_PASSWORD']
  end
end
