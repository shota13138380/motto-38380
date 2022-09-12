FactoryBot.define do
  factory :item do
    name                   { Faker::Name.name }
    content                { Faker::Lorem.sentence }
    privacy_id            { Faker::Number.between(from: 2, to: 3) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end