class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_dinners

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :account_update, keys: [:show_only_loved_meals]
  end

  def get_dinners
   @seven_random_dinners = Dinner.limit(7).order(Arel.sql('random()'))
  end



end
