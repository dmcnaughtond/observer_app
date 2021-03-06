class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show]
 before_action :correct_user,   only: [:edit, :update, :show]
 before_action :admin_user,     only: [:index, :destroy]
 

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
   
  end

  def index
    # if admin_user
      @users = User.where(activated: true).paginate(page: params[:page])
    # else
    #   redirect_to root_url
    # end
  end


  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)   
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :school, :password,
                                   :password_confirmation, 
                                    :rooms_attributes => [ :id, :number,
                                      :students_attributes => [ :id, :name ]
                                    ]
                                   )
                                    
  
                                   

    end


    def admin_user
      redirect_to(root_url) unless current_user.admin?  
    end
end
