class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  def index
    @users = User.all
  end

  def withdraw
    @user = User.find(params[:id])
    if @user.is_deleted == false
      @user.update(is_deleted: true)
      reset_session
      flash[:message] = "会員ステータスを退会へ変更しました。"
      redirect_to admin_root_path
    else
      @user.update(is_deleted: false)
      flash[:message] = "会員ステータスを有効へ変更しました。"
      redirect_to admin_root_path
    end
  end

end
