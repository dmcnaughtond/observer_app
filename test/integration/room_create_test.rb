require 'test_helper'

class RoomCreateTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:rocky)
	end

	test "room creation" do 
		log_in_as(@user)
		get createroom_path
		#invalid submission
		# assert_no_difference 'Room.count' do
		# 	post rooms_path, params: { room: { number: ""} }

		# end
		# assert_select 'div#error_explanation'
		#valid submission
		number = "304"
		first_name = "Daffy"
		last_name =  "Duck"
		assert_difference 'Room.count', 1 do
			post rooms_path, params: { room: { number: number},
									   student: { first_name: first_name,
									   			  last_name: last_name } }
		end


	end



end
