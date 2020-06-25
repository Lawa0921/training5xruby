class ApplicationController < ActionController::Base
  before_action :check_session
  helper_method :current_user

  private
  def check_session
    redirect_to new_session_path if not session[:login_session] 
  end

  def current_user
    User.find_by(id: session[:login_session])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
