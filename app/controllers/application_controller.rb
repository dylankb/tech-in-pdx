class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] rescue ActiveRecord::RecordNotFound
     session[:user_id] = nil
  end
  helper_method :current_user

  def authenticate_current_user
    unless current_user
      flash[:notice] = "You must be signed in to access that."
      redirect_to log_in_path
    end
  end
end
