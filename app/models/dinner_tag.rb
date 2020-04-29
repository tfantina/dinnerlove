class DinnerTag < ApplicationRecord
  belongs_to :tag
  belongs_to :dinner
end
