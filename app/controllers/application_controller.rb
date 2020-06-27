class ApplicationController < ActionController::Base
  before_action :check_session
  helper_method :current_user, :check_admin?

  def check_session
    redirect_to new_session_path if not session[:login_session] 
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:login_session])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_password_validation(user)
    user.errors.add(:password, "must be longer than 4 characters") if user.password.present? && user.password.length < 4
    user.errors.add(:password, "Password must be present") if user.password.blank?
    user.errors.add(:password, "Password and confirmation is not seem") if user.password != user.password_confirmation
  end
end
