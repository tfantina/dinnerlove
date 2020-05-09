# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meal_plans, dependent: :destroy
  has_many :dinners
  has_many :loves, dependent: :destroy
  has_many :user_tags, dependent: :destroy
  has_many :tags, through: :user_tags
end
