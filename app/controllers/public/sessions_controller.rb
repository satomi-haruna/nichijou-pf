# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ゲストログイン
  def guest_sign_in
    user = User.guest
    sign_in user
    # エラー文改行のために、ハッシュとしてpush(<<)、eachで取り出して3行表示
    flash[:message] = ['ゲストユーザーでログインしました']
    flash[:message] << '※ゲストユーザーで登録した予定や日記のデータは、3日間ですべて削除されます'
    flash[:message] << '記録を保存したい場合は、新規登録の上ご利用ください'
    redirect_to events_path
  end

  def after_sign_in_path_for(resource)
    flash[:message] = 'ログインしました'
    events_path
  end

  def after_sign_out_path_for(resource)
    flash[:message] = 'ログアウトしました'
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email])
  end

  # 退会しているかを判断するメソッド
  def user_state
    # 入力されたニックネームからアカウントを1件取得、取得できない場合メソッドを終了。
    # 取得できた場合、登録パスワードと入力パスワードが一致しているか判別かつ、userモデルの制限を利用し退会済みかどうか判別。
    @user = User.find_by(nickname: params[:user][:nickname])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false)
      flash[:message] = "退会済みです。別のメールアドレスにて再度ご登録ください。"
      redirect_to new_user_registration_path
    else
      flash[:message] = "項目を入力してください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
