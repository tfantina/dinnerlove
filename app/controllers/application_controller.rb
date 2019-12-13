class ApplicationController < ActionController::Base
  before_action :get_dinners
 # before_action :determine_plans

  def get_dinners 
   @seven_random_dinners = Dinner.limit(7).order(Arel.sql('random()'))
  end
  # def determine_plans 
  #   user = current_user
  #   if user then 
  #     user.meal_plans.find_by()
  # end
end
