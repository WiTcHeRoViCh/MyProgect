class MainsController < ApplicationController
  def index
  	if current_user
      @users = User.all - [current_user]
    else
      @users = User.all
    end    
  end
end
