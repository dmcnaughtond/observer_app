require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @room = rooms(:one)
    # This code is not idiomatically correct.
    @student = @room.students.build(name: "Daffy Duck")
  end

  test "should be valid" do
    assert @student.valid?
  end

  test "room id should be present" do
    @student.room_id = nil
    assert_not @student.valid?
  end

  test "name should be present" do
  	@student.name = " "
  	assert_not @student.valid?
  end

  test "name should be at most 50 characters" do
  	@student.name = "a" * 51
  	assert_not @student.valid?
  end
end
