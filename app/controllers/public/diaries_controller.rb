class Public::DiariesController < ApplicationController
  before_action :authenticate_user!

  # diaryのnew,show表示
  def new
    @event = Event.find(params[:event_id])
    @diary = Diary.new
  end

  def create
    @event = Event.find(params[:event_id])
    diary = Diary.new(diary_params)
    diary.event_id = @event.id
    diary.save
    redirect_to new_event_diary_path(@event.id)
  end

  def show
  #   @event = Event.find(params[:event_id])
  #   @diary = Diary.new
  end

  def edit
    @event = Event.find(params[:event_id])
    @diary = Diary.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @diary = Diary.find(params[:id])
    @diary.update(diary_params)
    redirect_to new_event_diary_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    Diary.find(params[:id]).destroy
    redirect_to new_event_diary_path(@event.id)
  end

  # 退会チェックする
  def withdraw_not_check
    true
  end

  private

  def diary_params
    params.require(:diary).permit(:event_id, :simple_diary, :detail, :image_id)
  end

end
