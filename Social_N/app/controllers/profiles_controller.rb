class ProfilesController < ApplicationController
	before_action :current_profile, only: [:show, :edit, :update]

  def show

  end
  
  def edit

  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(current_user)
    else
      render :new
    end    	
  end

  private

  def current_profile
  	@user = User.find(session[:user_id])
    @profile = @user.profile
  end	

  def profile_params
    params.require(:profile).permit(:gender, :birthday, :about, :avatar)
  end	

end	