class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :destroy, :update]

  def index
    @q = Mission.ransack(params[:q])
    @missions = @q.result.with_order(params[:order_by]).page(params[:page]).per(5).includes(:user)
  end

  def update
    @mission.user = User.first
    if @mission.update(mission_params)
      redirect_to missions_path, notice: t('missions.update')
    else
      flash[:notice] = t('missions.failure')
      render :edit
    end
  end

  def edit
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = User.first
    if @mission.save
      redirect_to missions_path, notice: t('missions.create')
    else
      flash[:notice] = t('missions.failure')
      render :new
    end
  end

  def destroy
    if @mission.destroy
      flash[:notice] = t('missions.delete')
    else
      flash[:notice] = t('missions.failure')
    end
    redirect_to missions_path
  end

  def show
  end

  private
  def mission_params
    params.require(:mission).permit(:name, :description, :status, :priority, :start_at, :end_at)
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
