class ProfilesController < ApplicationController
  before_action :current_profile, only: [:show, :edit, :update]
  load_and_authorize_resource
  
  def show
   
  end

  def edit
    #authorize! :update, @profile
  end

  def update
    #authorize! :update, @profile
    if @profile.update(profile_params)
      redirect_to user_profile_path(current_user, current_user)
    else
      render :new
    end
  end

  private

  def current_profile
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def profile_params
    params.require(:profile).permit(:gender, :birthday, :country, :about, :avatar)
  end
end
