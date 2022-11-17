# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン情報
# 本番環境にデータがあればスキップ、なければデータを追加
admin_data = Admin.find_by(email: ENV['ADMIN_EMAIL'])
if admin_data.nil?
  Admin.create!(
    email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD'],
  )
end

# ユーザーのテストデータ
users = [
  {
    first_name: '信乃',
    last_name: '犬塚',
    first_name_kana: 'シノ',
    last_name_kana: 'イヌヅカ',
    nickname: 'こう',
    email: 'kou_inuduka@eight.com',
    password: 'inuduka'
  },
  {
    first_name: '荘助',
    last_name: '犬川',
    first_name_kana: 'ソウスケ',
    last_name_kana: 'イヌカワ',
    nickname: 'ぎー',
    email: 'gi_inukawa@eight.com',
    password: 'inukawa'
  },
  {
    first_name: '道節',
    last_name: '犬山',
    first_name_kana: 'ドウセツ',
    last_name_kana: 'イヌヤマ',
    nickname: 'ちゅう',
    email: 'tyu_inuyama@eight.com',
    password: 'inuyama'
  },
  {
    first_name: '現八',
    last_name: '犬飼',
    first_name_kana: 'ゲンパチ',
    last_name_kana: 'イヌカイ',
    nickname: 'しん',
    email: 'shin_inukai@eight.com',
    password: 'inukai'
  },
  {
    first_name: '小文吾',
    last_name: '犬田',
    first_name_kana: 'コブンゴ',
    last_name_kana: 'イヌタ',
    nickname: 'てい',
    email: 'tei_inuta@eight.com',
    password: 'inutainuta'
  },
  {
    first_name: '親兵衛',
    last_name: '犬江',
    first_name_kana: 'シンベエ',
    last_name_kana: 'イヌエ',
    nickname: 'じん',
    email: 'jin_inue@eight.com',
    password: 'inueinue'
  },
  {
    first_name: '毛野',
    last_name: '犬坂',
    first_name_kana: 'ケノ',
    last_name_kana: 'イヌサカ',
    nickname: 'ちー',
    email: 'chi_inusaka@eight.com',
    password: 'inusaka'
  },
  {
    first_name: '大角',
    last_name: '犬村',
    first_name_kana: 'ダイカク',
    last_name_kana: 'イヌムラ',
    nickname: 'れい',
    email: 'rei_inumura@eight.com',
    password: 'inumura'
  },
  {
    first_name: '八犬伝',
    last_name: '里見',
    first_name_kana: 'ハッケンデン',
    last_name_kana: 'サトミ',
    nickname: '南総里見八犬伝',
    email: 'satomihakkenden@eight.com',
    password: 'hakkenden'
  },
  {
    first_name: '日誌',
    last_name: '日常',
    first_name_kana: 'ニッシ',
    last_name_kana: 'ニチジョウ',
    nickname: 'テストスケジュール',
    email: 'test_schedule@test.com',
    password: 'testschedule'
  }
]

# 本番環境にデータがあればスキップ、なければデータを追加
users.each do |user|
  # deviseの場合、ユーザーを一度メールアドレスで検索
  user_email = User.find_by(email: user[:email])
  # 該当しなければcreate
  if user_email.nil?
    User.create(
      first_name: user[:first_name],
      last_name: user[:last_name],
      first_name_kana: user[:first_name_kana],
      last_name_kana: user[:last_name_kana],
      nickname: user[:nickname],
      email: user[:email],
      password: user[:password]
    )
  end
end
