class Public::ListsController < ApplicationController
  def new
  end

  def create
    schedule = Schedule.find(params[:schedule_id])
    list =List.new(list_params)
    list.schedule_id = schedule.id
    list.save
    redirect_to schedule_path(schedule.id)
  end

  def edit
  end

  def update
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to schedule_path(params[:schedule_id])
  end

  private

  def list_params
    params.require(:list).permit(:schedule_id, :title, :item, :is_completed)
  end

end
