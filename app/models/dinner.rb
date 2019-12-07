class Dinner < ApplicationRecord
    belongs_to :user
    has_many :meals
    has_many :meal_plans, through: :meals
end
