ActiveAdmin.register Profile do 
  permit_params :second_name, :country, :gender, :birthday, :about, :avatar

	controller do 

	private

  end

	form do |f|
		f.inputs "Profile fields" do	
      f.input :second_name
     	f.input :gender
     	f.input :country
     	f.input :birthday
     	f.input :about
     	f.input :avatar

		end
	f.button :Submit	
	end		


end	