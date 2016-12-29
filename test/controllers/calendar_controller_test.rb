require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get calendrier" do
    get calendar_calendrier_url
    assert_response :success
  end

end
