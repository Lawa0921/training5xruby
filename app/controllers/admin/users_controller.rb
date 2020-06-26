class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @q = @user.missions.ransack(params[:q])
    @missions = @q.result.with_order(params[:order_by]).page(params[:page]).per(5).includes(:user)
  end
end
