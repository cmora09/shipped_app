class BoatsController < ApplicationController
	def index
  		@user = current_user
  		@boats = @user.boats.all
	end

	def new
  		@boat = Boat.new(params[:id])
	end

	def create
		# byebug
  		@boat = current_user.boats.build(boat_params)
  		if @boat.save
  			flash[:notice] = "You've added a new boat to your fleet!"
  			redirect_to root_path
		else
			flash[:alert] = "Error in adding boat. Please try again!"
  			redirect_to new_post_path
  		end
  	end

	def edit
  		@boat = Boat.find(params[:id])
	end

	def update
		@boat = Boat.find(params[:id])
		if @boat.update(boat_params)
			@boat.save
			flash[:notice] = "Updated your boat's information successfully!"
			redirect_to users_path
		else
			flash[:alert] = "Error! Update not successful. Please try again."
			redirect_to users_path	
		end
	end

	def show
		# @user = User.find(params[:id])
		@boat = Boat.find(params[:id])
		@jobs = @boat.jobs
	end

	def destroy
		@boat = Boat.find(params[:id])
		if @boat.destroy
			flash[:notice] = "This boat has been deleted!"
		else
			flash[:alert] = "Error; Boat not deleted. Try again."
		end
			redirect_to users_path
	end

	private
		def boat_params
    	params.require(:boat).permit(:boat_name, :container_cap, :location, :avatar)
  	end

end
