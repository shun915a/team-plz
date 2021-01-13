FactoryBot.define do
  factory :team do
    association :myteam
    user { myteam.user }
    team_title { Faker::Lorem.sentence }
    team_game_id { Faker::Internet.username(specifier: 4..25) }
    team_text { Faker::Lorem.paragraph }
  end
end
