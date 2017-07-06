FactoryGirl.define do
  factory :like do
    association :note, factory: :note
    association :user, factory: :user
  end
end
