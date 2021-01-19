FactoryBot.define do
  factory :comment do
    text { 'text' }
    association :user
    association :picture
  end
end
