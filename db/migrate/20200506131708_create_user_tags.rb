# frozen_string_literal: true

class CreateUserTags < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tags do |t|
      t.references :user
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
