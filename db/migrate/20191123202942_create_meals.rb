# frozen_string_literal: true

class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.references :dinner
      t.references :meal_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
