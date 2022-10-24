class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # userデータのバリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :is_deleted, presence: true

  # ゲストログイン
  def self.guest
    find_or_create_by!(nickname: 'ゲスト', email: 'guest@sample.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = 'ゲスト'
      user.first_name = 'ゲスト'
      user.last_name_kana = 'ゲスト'
      user.first_name_kana = 'ゲスト'
    end
  end

  # is_deletedがfalse(＝退会していない)ならtrueを返す。退会済みユーザのログインを制限
  def active_for_authentication?
    super && (is_deleted == false)
  end

  has_many :events, dependent: :destroy
end
