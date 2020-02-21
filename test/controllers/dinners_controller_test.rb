require 'test_helper'

class DinnersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
include FactoryBot::Syntax::Methods
  setup do
    @user = create(:user)
    @dinner = create(:dinner, user: @user)

    sign_in @user
  end

  test "should get index" do
    get dinners_path
    assert_response :success
  end

  test "should get new" do
    get new_dinner_path
    assert_response :success
  end

  test "should create dinner" do

    get new_dinner_path
    assert_response :success
    post dinners_path, params: { dinner: {name: "Stir Fry", notes: "Broccoli with big tofu chunks" } }
    assert_redirected_to dinner_url(Dinner.last)
  end

# I'm not sure yet what this page will show, user submitted dinners, user liked dinners or
# individual dinners
  # test "should show dinner" do
  #   get dinner_url(@dinner)
  #   assert_response :success
  # end

  test "should get edit" do
    get edit_dinner_url(@dinner)
    assert_response :success
  end

  test "should update dinner" do
    patch dinner_url(@dinner), params: { dinner: { love: @dinner.love, name: @dinner.name, notes: @dinner.notes } }
    assert_redirected_to @dinner
  end

  test "should destroy dinner" do
    assert_difference('Dinner.count', -1) do
      delete dinner_url(@dinner)
    end

    assert_redirected_to dinners_url
  end

  test "should love a dinner" do
    post love_dinner_path(@dinner)
    assert_response :success
  end
end
