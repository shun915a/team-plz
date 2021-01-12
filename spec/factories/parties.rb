FactoryBot.define do
  factory :party do
    association :user
    party_title { Faker::Lorem.sentence }
    party_game_id { Faker::Internet.username(specifier: 4..25) }
    party_text { Faker::Lorem.paragraph }
  end
end
