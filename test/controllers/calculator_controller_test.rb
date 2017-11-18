require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get pace_form" do
    get calculator_pace_form_url
    assert_response :success
  end

end
