class MealPlan < ApplicationRecord
    belongs_to :user
    has_many :meals
    has_many :dinners, through: :meals
end

