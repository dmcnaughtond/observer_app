require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
	include ApplicationHelper

	def setup
		@user = users(:rocky)
	end

	test "profile display" do
		log_in_as(@user)
		get user_path(@user)
		assert_template 'users/show'
		assert_select 'title', full_title(@user.name)
		assert_select 'h1', text: @user.name
		assert_select "a[href=?]", edit_user_path(@user)
		if @user.admin?
			assert_select "a[href=?]", users_path
		end
		if @user.rooms.any?
			assert_select 'h1', "Classes"
		end
	end
end
