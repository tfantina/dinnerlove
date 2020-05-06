# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :dinner_tags
  has_many :dinners, through: :dinner_tags
  has_many :users_tags
  has_many :users, through: :user_tags
end
