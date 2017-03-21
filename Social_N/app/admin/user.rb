ActiveAdmin.register User do
	permit_params :name, :admin

  controller do
    before_action :authenticate?

    def new 
      @user = User.new
    end

    def create
    	@user = User.new(user_params)
    	if @user.save
    		flash[:notice] = "New user has been created!"
    		redirect_to admin_user_path(@user)
    	else
    		flash[:error] = "Invalid params! Check the form!"
    		render :new
    	end	
    end
    


    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end	

    def authenticate?
    	unless current_admin?
        flash[:error] = "Access denied"
        redirect_to root_path, status: 403
      end 
    end	

  end

  index do
  	selectable_column
    column :id
    column :name
    column :admin
    column :profile
    actions
  end	

  show do 
  	panel "User information" do

    	table_for user do	
    		column :id
    		column :name
    		column :email
    		column :admin
    		column :created_at
        column :updated_at
    	end	

    end	
  end

  form do |f|
 		f.inputs "User's fields" do
  		
  		f.input :name
  		f.input :email
      f.input :admin
      if f.object.new_record?
      	f.input :password
      	f.input :password_confirmation
      end

 		end	
 	f.button :Submit	
  end	

end
