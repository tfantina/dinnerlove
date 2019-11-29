class Meal < ApplicationRecord
  belongs_to :dinner
  belongs_to :meal_plan
end
