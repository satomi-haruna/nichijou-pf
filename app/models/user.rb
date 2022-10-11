class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストログイン
  # def self.guest
  #   find_or_create_by!(nickname: 'ゲスト', email: 'guest@sample.com') do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #   end
  # end

  # is_deletedがfalse(＝退会していない)ならtrueを返す。退会済みユーザのログインを制限
  def active_for_authentication?
    super && (is_deleted == false)
  end

  has_many :schedules, dependent: :destroy
end
