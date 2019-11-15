class CreateDinners < ActiveRecord::Migration[6.0]
  def change
    create_table :dinners do |t|
      t.string :name
      t.text :notes
      t.timestamp :last_had
      t.integer :love

      t.timestamps
    end
  end
end
