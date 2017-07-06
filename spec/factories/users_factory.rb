FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password '123123'
  end
end
