FactoryBot.define do
  factory :friend do
    association :user
    friend_title { Faker::Lorem.sentence }
    friend_game_id { Faker::Internet.username(specifier: 4..25) }
    friend_text { Faker::Lorem.paragraph }
  end
end
