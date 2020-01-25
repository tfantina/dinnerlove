require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  include FactoryBot::Syntax::Methods

  setup do
    @user = create(:user)
    sign_in @user
  end
  test "has a meal for this week" do
    @meal_plan = create(:meal_plan, user: @user)
    puts "DO WE GET HERE #{@meal_plan}"
    get root_path
    asssert_select 'a', text: Date.today.beginning_of_week.next_week

end
