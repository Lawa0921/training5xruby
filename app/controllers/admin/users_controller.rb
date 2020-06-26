class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @q = @user.missions.ransack(params[:q])
    @missions = @q.result.with_order(params[:order_by]).page(params[:page]).per(5).includes(:user)
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
end
