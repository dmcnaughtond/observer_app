require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:rocky)
    @room = rooms(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Room.count' do
      post rooms_path, params: { room: { number: "240" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Room.count' do
      delete room_path(@room)
    end
    assert_redirected_to login_url
  end

  test "should get show" do
    log_in_as(@user)
    get room_path(@user)
  end

  test "should get new" do
  	log_in_as(@user)
  	get createroom_path(@user)
  end
end
