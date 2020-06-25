class SessionsController < ApplicationController
  skip_before_action :check_session

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email], password: user_params[:password])
    if user.present?
      session[:login_session] = user.id
      redirect_to root_path
    else
      redirect_to new_session_path, notice: t("notice.user.login_fail")
    end
  end
end
