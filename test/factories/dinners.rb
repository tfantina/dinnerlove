require 'faker'

FactoryBot.define do
  factory :dinner do
    name { Faker::Food::dish }
    notes { Faker::Food::descriptions }
    love { rand(0..10) }
    association :user, factory: :user, strategy: :build
  end
end
