require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get orders" do
    get students_orders_url
    assert_response :success
  end
end
