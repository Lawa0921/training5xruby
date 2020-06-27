class UsersController < ApplicationController
  skip_before_action :check_session

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.check_password_save
    if @user.validation_success
      redirect_to new_session_path, notice: t("notice.user.create_success")
    else
      flash[:notice] = t('notice.user.create_fail')
      render :new
    end
  end
end
