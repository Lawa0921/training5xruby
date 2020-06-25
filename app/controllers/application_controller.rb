class ApplicationController < ActionController::Base
  before_action :check_session

  private
  def check_session
    redirect_to session_new_path if not session[:login_session] 
  end

  def current_user
    @user ||= User.find_by(id: session[:login_session])
  end
end
