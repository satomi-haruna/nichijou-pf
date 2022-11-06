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


User.create!(
  [
    {
      first_name: '犬塚',
      last_name: '信乃',
      first_name_kana: 'いぬづか',
      last_name_kana: 'しの',
      nickname: 'こう'
      email: 'kou_inuduka@eight.com',
      password:              'inuduka',
      password_confirmation: 'inuduka'
    },
    {
      first_name: '犬川',
      last_name: '荘助',
      first_name_kana: 'いぬかわ',
      last_name_kana: 'そうすけ',
      nickname: 'ぎー'
      email: 'gi_inukawa@eight.com',
      password:              'inukawa',
      password_confirmation: 'inukawa'
    }
  ]
)