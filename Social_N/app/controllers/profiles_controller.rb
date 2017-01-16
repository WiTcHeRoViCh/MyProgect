class ProfilesController < ApplicationController
	before_action :current_profile

  def show

  end
  
  def edit

  end

  def update

  end

  private

  def current_profile
  	@user = User.find(session[:user_id])
    @profile = @user.profile
  end	

  def profile_params
    params.require(:profile).permit(:gender, :birthday, :about)
  end	

end	