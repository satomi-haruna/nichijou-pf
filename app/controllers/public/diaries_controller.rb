class Public::DiariesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    event = event.find(params[:event_id])
    diary = Diary.new(diary_params)
    diary.event_id = event.id
    diary.save
    redirect_to event_path(event.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    Diary.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private

  def diary_params
    params.require(:diary).permit(:event_id, :simple_diary, :detail, :image_id)
  end

end
