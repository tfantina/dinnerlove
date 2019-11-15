class MealPlan < ApplicationRecord
    belongs_to: User
    has_many: Meals
end
