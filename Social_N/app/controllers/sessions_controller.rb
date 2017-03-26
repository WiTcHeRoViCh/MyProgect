class SessionsController < ApplicationController
  load_and_authorize_resource

  def new

  end

  def create
    if params[:email]
      user = User.find_by(email: params[:email])
    else
      params[:password] = "123"
      user = User.find_or_create_by(email: auth_params['info']['email'], name: auth_params['info']['first_name'],
                                      password_digest: "$2a$10$mkfG63yfU39pEN1ISskzUejJTeNvM5TQkK6SMsPTdaFLbWDhxsdeW")  
    end

    if user && ( user.authenticate(params[:password]) )
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = "No user with this email or password"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end
end
