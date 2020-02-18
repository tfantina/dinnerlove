class CreateLove < ActiveRecord::Migration[6.0]
  def change
    create_table :loves do |t|
      t.references :dinner, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
