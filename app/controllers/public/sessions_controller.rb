# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

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
    # 取得できた場合、登録パスワードと入力パスワードが一致しているか判別かつ、is_deletedカラムの値を確認し退会済みかどうか判別。
    @user = User.find_by(nickname: params[:user][:nickname])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      flash[:notice] = "退会済みです。別のメールアドレスにて再度ご登録ください。"
      redirect_to new_user_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
