class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
       session[:user_id] = nil
    end
  end
  helper_method :current_user

  def current_user_is_admin?
    current_user ? current_user.admin : false
  end
  helper_method :current_user_is_admin?

  def authenticate_admin
    unless current_user_is_admin?
      flash[:alert] = "You are not an admin. Action not permitted"
      redirect_to log_in_path
    end
  end

  def authenticate_current_user
    unless current_user
      flash[:alert] = "You must be logged in to access that. Log in first to proceed."
      redirect_to log_in_path
    end
  end
end
