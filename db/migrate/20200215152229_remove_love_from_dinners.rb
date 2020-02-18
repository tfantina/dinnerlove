class RemoveLoveFromDinners < ActiveRecord::Migration[6.0]
  def change

    remove_column :dinners, :love, :integer
  end
end
