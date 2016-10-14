class ProfilesController < ApplicationController

  before_action :authenticate_current_user, :only => [:new, :create]

  def new
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    if @user.profile = @profile
      flash[:notice] = "Profile saved!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private
  def profile_params
    params.require(:profile).permit(:github_username)
  end

end
