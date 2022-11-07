# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
)


users = [
  {
    first_name: '犬塚',
    last_name: '信乃',
    first_name_kana: 'いぬづか',
    last_name_kana: 'しの',
    nickname: 'こう',
    email: 'kou_inuduka@eight.com',
    password:              'inuduka',
    password_confirmation: 'inuduka'
  },
  {
    first_name: '犬川',
    last_name: '荘助',
    first_name_kana: 'いぬかわ',
    last_name_kana: 'そうすけ',
    nickname: 'ぎー',
    email: 'gi_inukawa@eight.com',
    password:              'inukawa',
    password_confirmation: 'inukawa'
  },
  {
    first_name: '犬山',
    last_name: '道節',
    first_name_kana: 'いぬやま',
    last_name_kana: 'どうせつ',
    nickname: 'ちゅう',
    email: 'tyu_inuyama@eight.com',
    password:              'inuyama',
    password_confirmation: 'inuyama'
  },
  {
    first_name: '犬飼',
    last_name: '現八',
    first_name_kana: 'いぬかい',
    last_name_kana: 'げんぱち',
    nickname: 'しん',
    email: 'shin_inukai@eight.com',
    password:              'inukai',
    password_confirmation: 'inukai'
  },
  {
    first_name: '犬田',
    last_name: '小文吾',
    first_name_kana: 'いぬた',
    last_name_kana: 'こぶんご',
    nickname: 'てい',
    email: 'tei_inuta@eight.com',
    password:              'inutainuta',
    password_confirmation: 'inutainuta'
  },
  {
    first_name: '犬江',
    last_name: '親兵衛',
    first_name_kana: 'いぬえ',
    last_name_kana: 'しんべえ',
    nickname: 'じん',
    email: 'jin_inue@eight.com',
    password:              'inueinue',
    password_confirmation: 'inueinue'
  },
  {
    first_name: '犬坂',
    last_name: '毛野',
    first_name_kana: 'いぬさか',
    last_name_kana: 'けの',
    nickname: 'ちー',
    email: 'chi_inusaka@eight.com',
    password:              'inusaka',
    password_confirmation: 'inusaka'
  },
  {
    first_name: '犬村',
    last_name: '大角',
    first_name_kana: 'いぬむら',
    last_name_kana: 'だいかく',
    nickname: 'れい',
    email: 'rei_inumura@eight.com',
    password:              'inumura',
    password_confirmation: 'inumura'
  },
  {
    first_name: '里見',
    last_name: '八犬伝',
    first_name_kana: 'さとみ',
    last_name_kana: 'はっけんでん',
    nickname: '南総里見八犬伝',
    email: 'satomihakkenden@eight.com',
    password:              'hakkenden',
    password_confirmation: 'hakkenden'
  }
]

users.each do |user|
  user.find_or_create_by(user)
end