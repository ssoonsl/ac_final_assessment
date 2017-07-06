FactoryGirl.define do
  factory :note do
    association :user, factory: :user
    body 'bodytext'
  end
end
