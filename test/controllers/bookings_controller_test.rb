require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get reserve_seats" do
    get bookings_reserve_seats_url
    assert_response :success
  end

end
