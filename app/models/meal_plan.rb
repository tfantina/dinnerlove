# frozen_string_literal: true

class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :dinners, through: :meals
end
