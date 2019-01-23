require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @user = users(:rocky)
    @room = @user.rooms.build(number: "200")
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "user id should be present" do
    @room.user_id = nil
    assert_not @room.valid?
  end

  test "number should be present" do
  	@room.number = " "
  	assert_not @room.valid?
  end

  test "order should be lowest number first" do
  	assert_equal rooms(:two), Room.first
  end

  test "associated students should be destroyed" do
    @room.save
    @room.students.create!(name: "Daffy Duck")
    assert_difference 'Student.count', -1 do
      @room.destroy
    end
  end
end
