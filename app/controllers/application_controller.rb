class ApplicationController < ActionController::Base
  before_action :check_session
  helper_method :current_user, :check_admin?

  def check_session
    redirect_to new_session_path if not session[:login_session] 
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:login_session])
  end
  
  def check_admin
    redirect_to missions_path, notice: t("check_admin") unless check_admin?
  end
  
  def check_admin?
    current_user.authority == "admin"
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
