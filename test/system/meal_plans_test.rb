require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:travis)
    sign_in @user
  end
  test "has a meal for this week" do
    @meal_plan = meal_plans(:this_week)
    puts "DO WE GET HERE #{@meal_plan}"
    get root_path
    asssert_selector 'a', text: Date.today.beginning_of_week.next_week

end
