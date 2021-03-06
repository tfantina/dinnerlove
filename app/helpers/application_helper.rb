# frozen_string_literal: true

module ApplicationHelper
  def link_builder(link)
    classes = 'button button-create button-log-radius'
    case link
    when :shuffle
      link_to 'Shuffle', dinners_path, class: classes
    when :add_dinner
      link_to 'Add Dinner', new_dinner_path, class: classes if user_signed_in?
    when :back
      link_to 'Back', dinners_path, class: classes
    when :edit
      if user_signed_in? && current_user.id == @dinner.user_id
        link_to 'Edit', edit_dinner_path(@dinner), class: classes
      end
    end
  end

  def show_svg(path)
    File.open("app/assets/images/icons/#{path}.svg", 'rb') do |file|
      raw file.read
    end
  end
end
