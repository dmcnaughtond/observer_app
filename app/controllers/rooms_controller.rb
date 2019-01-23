class RoomsController < ApplicationController

before_action :logged_in_user, only: [:create, :destroy, :edit, :update, :show]
before_action :correct_user,   only: :destroy

	def new
		@room = current_user.rooms.build if logged_in?
		2.times { @student = @room.students.build }
		
	end

  def create

	@room = current_user.rooms.build(room_params)


    if @room.save
      flash[:success] = "New class created."
      redirect_to current_user
    else
      render 'rooms/new'
    end
  end

  def destroy
  	@room.destroy
    flash[:success] = "Room deleted"
    redirect_to request.referrer || root_url
  end

  def edit
  	@room = Room.find(params[:id])
  end

  def update
  	@room = Room.find(params[:id])
  	if @room.update_attributes(room_params)
  		redirect_to @room
  		flash[:success] = "Class updated."
  	end
  end

  def show
  	#@user = User.find(params[:id])
  	@room = Room.find(params[:room_id])
  	@number = @room.number
  	#@students = @room.students.map(&:name).join("<br>").html_safe
  end


  private

    def room_params
      params.require(:room).permit(:number, :students_attributes => [:id, :name])

    end

    def correct_user
      @room = current_user.rooms.find_by(id: params[:id])
      redirect_to root_url if @room.nil?
    end
end


