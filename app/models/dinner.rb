class Dinner < ApplicationRecord
    validates :name, uniqueness: true, presence: true

    belongs_to :user
    has_many :meals
    has_many :meal_plans, through: :meals
    has_many :loves
end
