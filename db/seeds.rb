require 'faker'

20.times do
  email = Faker::Internet.email
  password = '123123'
  User.create(email: email, password: password)
end

for i in (1..20)
  body = Faker::Lorem.paragraph
  Note.create(user: User.find(i), body: body)
end
