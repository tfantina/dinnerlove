class AddUserRefToDinners < ActiveRecord::Migration[6.0]
  def change
    add_reference :dinners, :user, foreign_key: true
  end
end
