FactoryBot.define do
  factory :myteam do
    association :user
    team_name { Faker::Internet.username(specifier: 4..25) }
    team_profile { Faker::Lorem.paragraph }
  end
end
