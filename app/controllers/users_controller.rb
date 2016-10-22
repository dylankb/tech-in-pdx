class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:notice] = "You created a new account! Confirm your acccount by clicking the link in your email"
      redirect_to root_path
    else
      render :new
    end
  end

  def confirm_email
    @user = User.find_by_confirmation_token(params[:id])
    if @user
      user.email_activate
      flash[:success] = "Welcome to Tech-in-PDX. Your email has been confirmed"
      redirect_to
    else
      flash[:alert] = "Sorry. User does not exist"
      redirect_to root_path
    end
  end

  def email_activate
    self.email_confirmed = true
    self.confirmation_token = nil
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
