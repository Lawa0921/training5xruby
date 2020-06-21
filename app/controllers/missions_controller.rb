class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :destroy, :update]

  def index
    @missions = Mission.all.order("created_at desc")
  end

  def update
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
    params.require(:mission).permit(:name, :description, :status, :order, :start_at, :end_at)
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
