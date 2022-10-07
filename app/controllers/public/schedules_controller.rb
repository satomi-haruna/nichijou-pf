class Public::SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save
    redirect_to public_schedules_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end


  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :plan, :plan_detetime, :allday_flg, :memo, :place, :color_id, :is_active)
  end


end
