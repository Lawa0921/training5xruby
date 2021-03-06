class SessionsController < ApplicationController
  skip_before_action :check_session

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(params[:user][:password])
      session[:login_session] = user.id
      redirect_to root_path
    else
      redirect_to new_session_path, notice: t("notice.user.login_fail")
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path, notice: t("notice.user.logout")
  end
end
