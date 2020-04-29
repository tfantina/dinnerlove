# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :love do
    association :dinner, factory: :dinner, strategy: :build
    association :user, factory: :user, strategy: :build
  end
end
