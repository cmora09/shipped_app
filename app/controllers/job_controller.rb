class JobController < ApplicationController
 	def new
		@boat = Boat.find(params[:boat_id])
		@comment = Comment.new
	end

	def create
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.build(job_params)
		@job.user_id = current_user.id
		@job.save
		redirect_to boat_path(@boat)
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		if @job.update(job_params)
			@job.save
			flash[:notice] = "Edited Job succesfully"
			redirect_to users_path
		else
			flash[:alert] = "Error! Your job edit was not succesful. Please try again"
			redirect_to users_path
		end
	end

	private
	def job_params
		params.require(:job).permit(:job_name, :containers_needed, :cost, :origin, :destination, :cargo)
	end
end
