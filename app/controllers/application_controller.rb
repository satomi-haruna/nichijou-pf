class ApplicationController < ActionController::Base
  before_action :withdraw_check, if: :withdraw_not_check

  # 管理者側で「退会」にした場合、会員は閲覧できなくなる。
  # 退会チェックする場合、withdraw_not_checkメソッドtrueを記述。
  # public機能以外は基本的に退会チェックしない。
  def withdraw_not_check
    false
  end

  def withdraw_check
    # ログインしていない または 退会している → topに戻す
    if !user_signed_in? || current_user.is_deleted == true
      redirect_to root_path
    end
  end

end
