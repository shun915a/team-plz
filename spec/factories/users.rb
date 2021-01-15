FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password { password + 'a0' }
    password_confirmation { password + 'a0' }
    nickname { Faker::Internet.username(specifier: 4..25) }
    gender_id { Faker::Number.between(from: 1, to: 3) }
    birthday { Faker::Date.birthday(min_age: 0, max_age: 90) }
    profile { Faker::Lorem.sentence }
    twitter_name { Faker::Internet.username(specifier: 4..15) }
    twitch_name { Faker::Internet.username(specifier: 4..25) }
    mildom_name { Faker::Number.number(digits: 10) }
  end
end
