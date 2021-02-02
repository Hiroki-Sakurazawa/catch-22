FactoryBot.define do
  factory :user do
    user_name              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000000' }
    password_confirmation { password }
  end
end
