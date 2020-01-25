require 'test_helper'
class MealsPlansControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include FactoryBot::Syntax::Methods

  setup do
    @user = create(:user)
    mealplan_params = attributes_for(:meal_plan, user: @user)
    @mealplan = @user.meal_plans.create(mealplan_params)
    sign_in @user
  end

  test "should create a mealplan" do
      params = attributes_for(:meal_plan)
      post meal_plans_url, params: { meal_plan: params }

    assert_redirected_to meal_plan_path(MealPlan.last)
  end

  test "should show a mealplan" do
     get meal_plan_path(@mealplan.id)
     assert_response :success
  end

  test "buttons show next week when there is a meal plan for this one" do
    user = create(:user)
    sign_in user

    mealplan = create(:meal_plan, user: user, weekof: Date.today.beginning_of_week)
    get meal_plan_path(mealplan)

    assert_select ".button-log form" do
      assert_select "form input[type='submit'][value='Plan Next Week']"
      assert_select "form input[type='submit'][value='Plan This Week']", false
    end
    assert_select ".button-log", text: Date.today.beginning_of_week.to_s
  end

  test "buttons show this week when there is a meal plan for next week" do
    user = create(:user)
    sign_in user
    mealplan = create(:meal_plan, user: user, weekof: Date.today.beginning_of_week.next_week)
    get meal_plan_path(mealplan)

    assert_select ".button-log" do
      assert_select "form input[type='submit'][value='Plan This Week']"
      assert_select "form input[type='submit'][value='Plan Next Week']", false
    end

    assert_select ".button-log", text: Date.today.beginning_of_week.next_week.to_s
  end

  test "when two meal plans exist, there is no option to create one" do
    user = create(:user)
    sign_in user
    create(:meal_plan, user: user, weekof: Date.today.beginning_of_week)
    mealplan  = create(:meal_plan, user: user, weekof: Date.today.beginning_of_week.next_week)
    get meal_plan_path(mealplan)
    assert_select ".button-log" do
      assert_select "form input[type='submit'][value='Plan This Week']", false
      assert_select "form input[type='submit'][value='Plan Next Week']", false
    end

    assert_select ".button-log a.button.button-show", 2



  end

end
