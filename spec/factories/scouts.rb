FactoryBot.define do
  factory :scout do
    association :user
    scout_title { Faker::Lorem.sentence }
    scout_game_id { Faker::Internet.username(specifier: 4..25) }
    scout_text { Faker::Lorem.paragraph }
  end
end
