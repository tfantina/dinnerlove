require 'test_helper'

class DinnerTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include FactoryBot::Syntax::Methods

  test "Dinner.name must be unique" do
    dinner = create(:dinner, name: "YummyYum")
    duplicate_dinner = dinner.dup
    assert dinner.valid?
    assert_not duplicate_dinner.valid?
  end

  test "Dinner.name must exist" do
    dinner = build(:dinner, name: " ")
    assert_not dinner.valid?
  end
end
