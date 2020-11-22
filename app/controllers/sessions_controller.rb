class SessionsController < ApplicationController
	def new;end

	def create
		user = User.find_by(mail: params[:session][:email].downcase)
		if user&.authenticate(params[:session][:password])
			log_in user
			redirect_back_or root_url
		else
		  # Create an error message.
		  flash.now[:danger] = t("controllers.sessions.login_fail_danger")
		  render "new"
		end
	end
	
	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end
