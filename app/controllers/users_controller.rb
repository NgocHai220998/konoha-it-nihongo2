class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
		 flash[:success] = t "controllers.users.signup_success"
		 redirect_to root_url
		else
			render "new"
		end
	end
	
	def edit
		@user = current_user
	end
	
	def update
		@user = current_user
		if @user.update_attributes(user_params)
		    flash[:success] = t "controllers.users.edit_success"
			redirect_to root_url
		else
		    render 'edit'
		end
	end
	
	private
	
	def user_params
		params.require(:user).permit(:name, :mail, :password, :password_confirmation, :nickname, :age)
	end
end
