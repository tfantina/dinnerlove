# frozen_string_literal: true

class AddShowOnlyLovedMealsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :show_only_loved_meals, :boolean, default: false
  end
end
