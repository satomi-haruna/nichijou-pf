class Public::DiariesController < ApplicationController
  def new
    @diary = Diary.new
    @schedule = Schedule.new
  end

  def create
    # @schedule = Schedule.find(params[:schedule_id])
    # @diary = Diary.new(diary_params)
    # # diary.schedule_id = schedule.id
    # diary.save
    # redirect_to public_schedules_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary).permit(:schedule_id, :simple_diary, :detail, :image_id)
  end

end
