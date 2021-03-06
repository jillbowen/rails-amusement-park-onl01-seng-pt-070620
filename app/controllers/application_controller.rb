class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    !!current_user
  end

  def verify_user
    redirect_to '/' unless authenticate_user
  end

end
