module ApplicationHelper
  def link_builder(link)
  
    case link
    when :shuffle
      link_to "Shuffle", dinners_path, class: "button button-create button-log-radius"
    when :add_dinner
      link_to "Add Dinner", new_dinner_path, class: "button button-create button-log-radius"
    end
  end

end
