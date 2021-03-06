class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update, :create_admin]
  before_action :check_admin

  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @q = @user.missions.ransack(params[:q])
    @missions = @q.result.with_order(params[:order_by]).includes(:user).includes(:tags).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.check_password_save
    if @user.validation_success
      redirect_to admin_users_path, notice: t("notice.user.create_success")
    else
      flash[:notice] = t('notice.user.create_fail')
      render :new
    end
  end

  def edit
  end

  def update
    @user.check_password_save
    if @user.validation_success
      @user.update(user_params)
      redirect_to admin_users_path, notice: t('users.update')
    else
      flash[:notice] = t('users.update_failure')
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = t('users.destroy')
    else
      flash[:notice] = t('users.destroy_failure')
    end
    redirect_to admin_users_path
  end

  def create_admin
    @user.admin? ? @user.member! : @user.admin!
    redirect_to admin_users_path, notice: t("notice.user.create_admin")
  end

  private
  def check_admin
    redirect_to missions_path, notice: t("check_admin") unless current_user.admin?
  end
end
