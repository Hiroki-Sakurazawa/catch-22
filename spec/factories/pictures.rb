FactoryBot.define do
  factory :picture do
    title              { 'test' }
    text               { 'test' }
    genre_id           { 1 }
    association :user

    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
