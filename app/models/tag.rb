class Tag < ApplicationRecord
  has_many :dinner_tags
  has_many :dinners, through: :dinner_tags
end
