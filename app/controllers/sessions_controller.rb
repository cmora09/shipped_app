class SessionsController < ApplicationController
	def new
  	
  	end
	# processes data from login form
	def create
		#grabs use first object of the array
		
		@user = User.where(username: params[:username]).first
		if @user && @user.authenticate(params[:password]) #authenticate is a  bcrypt method that takes in the params password and hashes it to make sure it matches hashed password
			session[:user_id] = @user.id
			redirect_to root_path
		else
			redirect_to login_path
		end
	end

	# log off
	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end
end
