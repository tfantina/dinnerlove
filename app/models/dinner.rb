class Dinner < ApplicationRecord
    has_one :user
    has_many :meals 
    has_many :meal_plans, through: :meals
end
