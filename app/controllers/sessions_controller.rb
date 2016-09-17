class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params["/log-in"][:email], params["/log-in"][:password])
    if @user
      flash[:notice] = "You've logged in!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "There was a problem with your username or password. Try again."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out"
    redirect_to root_path
  end
end
