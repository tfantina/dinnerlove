require "test_helper"
require 'capybara/rails'
#require "capybara/webkit"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome #screen_size: [1400, 1400]
end
