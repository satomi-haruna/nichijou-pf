class Public::EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    redirect_to event_path(@event.id)
  end

  def show
    @event = Event.find(params[:id])
    @diary = Diary.new
    @list = List.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path(event.id)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  def index
    # fullcalendar表示には変数eventである必要がある
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :plan, :plan_detetime, :allday_flg, :memo, :place, :color_id, :is_active)
  end

end
