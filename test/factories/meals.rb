# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :meal do
    association :user, factory: :user, strategy: :build
    association :dinner, factory: :dinner, strategy: :build
  end

  factory :meal_plan do
    sequence(:id) { |number| number }
    association :user, factory: :user, strategy: :build
    weekof { Date.today.beginning_of_week }
    # after(:create) do
    #   create_list(:meal, 7)
    # end
  end
end
