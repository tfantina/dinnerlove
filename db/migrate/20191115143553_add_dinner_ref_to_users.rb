class AddDinnerRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :dinner, foreign_key: true
    add_reference :users, :meal_plan, foreign_key: true
  end
end


