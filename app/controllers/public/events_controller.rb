class Public::EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event.id)
    else
      flash.now[:message] = "予定名と日時は必須項目です"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @diary = Diary.new
    @list = List.new
    @color_id = @event.color_id
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      flash.now[:message] = "予定名と日時は必須項目です"
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  def index
    # fullcalendar表示には変数eventである必要がある
    # ログインユーザーの登録情報を一覧表示
    @events = current_user.events
  end

  # 退会チェックする
  def withdraw_not_check
    true
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :plan, :plan_datetime, :allday_flg, :memo, :place, :color_id, :is_active)
  end

end
