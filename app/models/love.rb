# frozen_string_literal: true

class Love < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :dinner_id
  belongs_to :user
  has_one :dinner
end
