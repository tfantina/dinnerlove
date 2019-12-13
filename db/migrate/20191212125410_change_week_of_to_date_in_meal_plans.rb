class ChangeWeekOfToDateInMealPlans < ActiveRecord::Migration[6.0]
  def change
      change_column :meal_plans, :weekof, :date
  end
end
