class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(mail: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "controllers.password_resets.send_reset_mail_success"
      redirect_to root_url
    else
      flash.now[:danger] = t "controllers.password_resets.email_not_found"
      render "new"
    end
  end
  
  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, t("controllers.password_resets.can_not_be_empty"))
      render 'edit'
    elsif
      @user.update_attributes(user_params)
      @user.update_attribute( :reset_digest, nil)
      flash[:success] =  t "controllers.password_resets.password_resetted"
      redirect_to login_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require( :user).permit( :password, :password_confirmation)
    end
    
    def get_user
      @user = User.find_by(mail: params[:email])
    end

    def valid_user
      unless @user&.authenticated?( :reset, params[:id])
        redirect_to root_url
      end
    end  

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = t "controllers.password_resets.password_expired"
        redirect_to new_password_reset_url
      end
    end

end
