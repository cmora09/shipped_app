class SessionsController < ApplicationController
	def new
  	
  	end
	# processes data from login form
	def create
		#grabs use first object of the array
		@user = User.where(username: params[:username]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			redirect_to root_path
		end
	end

	# log off
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
