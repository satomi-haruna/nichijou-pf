class Event < ApplicationRecord
  belongs_to :user
  has_many :diaries, dependent: :destroy

  # 予定入力項目のバリデーション
  validates :user_id, presence: true
  validates :plan, presence: true
  validates :plan_datetime, presence: true
  validates :color_id, presence: true

  # 色分けのためのcolor_idをenumで設定
  enum color_id: {
    colorless:    0,
    pink:         1,
    red:          2,
    orange:       3,
    yellow:       4,
    yellow_green: 5,
    green:        6,
    light_blue:   7,
    blue:         8,
    purple:       9
  }

end
