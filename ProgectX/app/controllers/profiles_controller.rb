class ProfilesController < ApplicationController
  before_action :current_profile

  def index
  end  

  def show
    
  end	

  def edit

  end
  
  def update
    if @profile.update(profile_params)
    	redirect_to root_path
    else
      render :edit
    end  	
  end	

  private

  def current_profile
    @user = User.find(session[:user_id])
    @profile = @user.profile
  end	

  def profile_params
    params.require(:profile).permit(:gender, :about, :birthday)
  end	

end	