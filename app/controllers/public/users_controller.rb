class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_check

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更＝削除済み
    @user.update(is_deleted: true)
    reset_session
    flash[:message] = "退会が完了しました。ご利用ありがとうございました。"
    redirect_to root_path
  end

  # 退会チェックする
  def withdraw_not_check
    true
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :is_deleted)
  end

  def guest_check
    if current_user.email == 'guest@sample.com'
      flash[:message] = "ゲストユーザーはそちらの機能を利用できません。"
      redirect_to root_path
    end
  end

end
