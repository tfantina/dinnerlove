require 'test_helper'
class MealsPlansControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include FactoryBot::Syntax::Methods

  setup do
    user = create(:user)
    puts "#{user} this is a user"
    sign_in user
  end

  test "should create a mealplan" do

      post meal_plans_url, params: { meal_plan: {dinner_ids: Dinner.where(id: [1, 2, 3, 4, 5, 6, 7]),
                                                  weekof: Date.today.beginning_of_week.next_week } }

    assert_redirected_to meal_plan_path(MealPlan.last)
  end

  test "should show a mealplan" do
    @meal_plan = meal_plans(:next_week)
     get meal_plan_path(@meal_plan.id)
     assert_response :success
  end
end
