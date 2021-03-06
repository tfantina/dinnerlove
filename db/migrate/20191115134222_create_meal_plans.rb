# frozen_string_literal: true

class CreateMealPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :weekof
      t.string :meals
    end
  end
end
