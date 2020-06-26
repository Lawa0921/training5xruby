class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @q = @user.missions.ransack(params[:q])
    @missions = @q.result.with_order(params[:order_by]).includes(:user).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: t("notice.user.create_success")
    else
      flash[:notice] = t('notice.user.create_fail')
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
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
end
