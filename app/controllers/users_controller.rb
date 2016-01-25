class UsersController < ApplicationController
  def index
  	@user = current_user
    @boats = @user.boats.all
    @allboats = Boat.all
  	if !current_user
  		redirect_to login_path
  	end
  end

  def new
  	@user = User.new
  end

  def create
  	#creates user based on the params permitted in user_params action
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Your account has been created successfully."
 		redirect_to root_path
 	  else
 		 flash[:alert] = "There was a problem creating your account."
 		 redirect_to root_path
 	  end
  end

  def show
    @current_user = current_user
    @boat = Boat.find(params[:id])
  end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  	#finds user according to their id
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "Your information has been updated!"
  		redirect_to @user
  	else
  		flash[:alert] = "Your information has not been updated. Please try again"
  		redirect_to edit_user_path
  	end
  end

  def destroy
  	# finds user according to their id
  	@user = User.find(params[:id])
  	if @user.destroy
  		flash[:notice] = "Success"
  	else
  		flash[:alert] = "There was a problem deleting your account"
  	end
  	redirect_to users_path
  end

  private
  #only permits the following params to be introduced by user.
  def user_params
  	params.require(:user).permit(:fname, :lname, :email, :username, :password, :avatar)
  end
end
