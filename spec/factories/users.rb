FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password { password }
    password_confirmation { password }
    nickname { Faker::Name.name }
    gender_id { Faker::Number.between(from: 1, to: 3) }
    birthday { Faker::Date.birthday(min_age: 0, max_age: 90) }
    profile { Faker::Lorem.sentence }
    twitter_name { Faker::Name.name }
    twitch_name { Faker::Name.name }
    mildom_name { Faker::Name.name }
  end
end
