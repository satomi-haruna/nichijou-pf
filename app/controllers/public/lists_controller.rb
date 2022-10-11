class Public::ListsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    event = event.find(params[:event_id])
    list =List.new(list_params)
    list.event_id = event.id
    list.save
    redirect_to event_path(event.id)
  end

  def edit
  end

  def update
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private

  def list_params
    params.require(:list).permit(:event_id, :title, :item, :is_completed)
  end

end
