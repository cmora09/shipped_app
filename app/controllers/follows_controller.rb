class FollowsController < ApplicationController
	def new
	end

	def create
		@boat = Boat.find(params[:boat_id])
		# @newfollow = Follow.create(:boat_id)
		current_user.follows.build(@boat)
		redirect_to users_path
	end

	def destroy
		@boat = Follow.find(params[:id])
		current_user.follows.find(@boat).destroy
		redirect_to users_path
	end

end
