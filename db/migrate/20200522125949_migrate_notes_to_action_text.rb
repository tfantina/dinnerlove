# frozen_string_literal: true

# thanks to felici: https://github.com/rails/rails/issues/35002 for This
class MigrateNotesToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :dinners, :notes, :old_notes
    Dinner.all.each do |dinner|
      dinner.update_attribute(:notes, simple_format(dinner.old_notes))
    end
    remove_column :dinners, :old_notes
  end
end
