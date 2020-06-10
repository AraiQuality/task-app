# coding: utf-8

User.create!( name: "管理人",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")
              
99.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password
    )
end

@users = User.order(:created_at).take(3)
50.times do |n|
  title = Faker::Lorem.sentence(2)
  note = Faker::Lorem.sentence(5)
  @users.each { |user| user.tasks.create!(title: title, note: note)}
end