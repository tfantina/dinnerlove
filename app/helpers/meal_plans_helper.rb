module MealPlansHelper
  def active_week(meal_plans, meal_plan, week)
    if @meal_plans[week].id == @meal_plan.id 
      return "-active"
    end 
    return ""
  end
end