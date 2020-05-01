# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :dinner do
    name { Faker::Food.dish }
    notes { Faker::Food.descriptions }
    association :user, factory: :user, strategy: :build
  end
end
