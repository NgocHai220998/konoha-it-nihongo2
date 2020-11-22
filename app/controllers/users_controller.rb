class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params) # Not the final implementation!
        if @user.save
          # Handle a successful save.
        #   log_in @user
           flash[:success] = "Welcome to the Sample App!"
           redirect_to root_url
        else
          render "new"
        end
    end
    private

    def user_params
        params.require(:user).permit(:name, :mail, :password, :password_confirmation)
    end
end
