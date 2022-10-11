class Public::DiariesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    schedule = Schedule.find(params[:schedule_id])
    diary = Diary.new(diary_params)
    diary.schedule_id = schedule.id
    diary.save
    redirect_to schedule_path(schedule.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    Diary.find(params[:id]).destroy
    redirect_to schedule_path(params[:schedule_id])
  end

  private

  def diary_params
    params.require(:diary).permit(:schedule_id, :simple_diary, :detail, :image_id)
  end

end
