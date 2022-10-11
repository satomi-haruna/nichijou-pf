class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  def index
    @users = User.all
  end
end
