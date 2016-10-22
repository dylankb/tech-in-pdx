class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params["/log-in"][:email], params["/log-in"][:password])
    if @user
      if @user.email_confirmed == false
        flash[:notice] = "Please confirm your account by clicking the link in your email"
        redirect_to root_path
      else
        @user.email_confirmed == true
        flash[:notice] = "You've logged in!"
        session[:user_id] = @user.id
        redirect_to root_path
      end
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
