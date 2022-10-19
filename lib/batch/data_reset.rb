class Batch::DataReset
  # ゲストユーザーの投稿を削除
  def self.data_reset
    user = User.find_by(email: "guest@sample.com")
    user.events.destroy_all
  end
end