FactoryBot.define do
  factory :desk do
    association :user
    desk_text { Faker::Lorem.paragraph }

    after(:build) do |desk|
      desk.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
