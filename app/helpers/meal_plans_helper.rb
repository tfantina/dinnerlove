module MealPlansHelper
    def active_week(current_plan, week)
      puts current_plan[:weekof] == week.weekof
      if current_plan[:weekof] == week.weekof
            content_tag(:a, current_plan[:weekof], class: "button button-show-active button-log-radius")
      else
      link_to current_plan[:weekof],
            meal_plan_path(current_plan[:id]),
            class: "button button-show button-log-radius"
      end
    end
end
