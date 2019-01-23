class StudentsController < ApplicationController

	before_action	:logged_in_user, only: [:create, :destroy, :edit, :update, :show]
	before_action	:correct_user,   only: [:show, :destroy]




	def new
		# @student = current_user.rooms.build if logged_in?
		@student = @room.students.build(student_params)
		@student.save
		
	end

  	def create
  		@student = @room.students.build(student_params)
    	@student.save
    	logger.debug @student.errors.full_messages
     
  	end

	def show
	end

	def destroy
		# Student.find(params[:id]).destroy
		@student.destroy
	    flash[:success] = "Student deleted"
	    redirect_to users_url
	end

	  private

    def student_params
      params.require(:student).permit(:name)
    end

    def correct_user
      @student = current_user.students.find_by(id: params[:id])
      redirect_to root_url if @student.nil?
    end
end
