FactoryBot.define do
  factory :party_member do
    association :user
    association :party
    role { Faker::Number.between(from: 0, to: 2) }
  end
end
