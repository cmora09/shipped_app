class UsersController < ApplicationController
  def index
  	@user = current_user
  	@boats = @user.boats
  	if !current_user
  		redirect_to login_path
  	end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Your account has been created successfully."
 		redirect_to root_path
 	else
 		flash[:alert] = "There was a problem creating your account."
 		redirect_to root_path
 	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update()
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  		flash[:notice] = "Success"
  	else
  		flash[:alert] = "There was a problem deleting your account"
  	end
  	redirect_to users_path
  end

  private
  def user_params
  	params.require(:user).permit(:fname, :lname, :email, :username, :password)

end
