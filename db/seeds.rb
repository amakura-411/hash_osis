# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username:  "サンプルユーザーです",
    email: "usrtet@gmail.com",
    password:              "fakers",
    password_confirmation: "fakers")

    # 追加のユーザーをまとめて生成する
99.times do |n|
    name  = Faker::Name.name
    email = "exaples-#{n+1}@gm.com"
    password = "password"
    User.create!(username:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
  end

  # ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  chara_name = Faker::Name.name
  appear_in = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.characters.create!(chara_name: chara_name,appear_in: appear_in) }
end
  
