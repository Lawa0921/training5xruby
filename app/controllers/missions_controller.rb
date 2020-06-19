class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :destroy, :update]

  def index
    @missions = Mission.all
  end

  def update
    if @mission.update(mission_params)
      flash[:notice] = "任務更新成功"
    else
      flash[:notice] = "任務更新失敗"
    end
    redirect_to missions_path
  end

  def edit
  end

  def new
    @mission = Mission.new
  end

  def create
    mission = Mission.new(mission_params)
    if mission.save
      flash[:notice] = "任務創建成功"
    else
      flash[:notice] = "任務創建失敗"
    end
    redirect_to missions_path
  end

  def destroy
    if @mission.destroy
      flash[:notice] = "任務已刪除"
    else
      flash[:notice] = "任務刪除失敗"
    end
    redirect_to missions_path
  end

  def show
  end

  private
  def mission_params
    params.require(:mission).permit(:name, :description, :status, :order, :start_at, :end_at)
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
