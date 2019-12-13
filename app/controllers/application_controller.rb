class ApplicationController < ActionController::Base
  before_action :get_dinners

  def get_dinners 
   @seven_random_dinners = Dinner.limit(7).order(Arel.sql('random()'))
  end

end
