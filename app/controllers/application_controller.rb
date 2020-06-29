class ApplicationController < ActionController::Base
  before_action :check_session
  helper_method :current_user, :check_admin?
  rescue_from ActiveRecord::RecordNotFound, 
              with: :record_not_found

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

  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end
end
