class JobsController < ApplicationController
 def new
		@boat = Boat.find(params[:boat_id])
		@job = Job.new
	end

	def create
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.build(job_params)
		@job.user_id = current_user.id
		if @job.containers_needed > @boat.container_cap
			flash[:alert] = "Your ship's weak!WIZeek"
			redirect_to new_boat_job_path
		elsif @job.origin == @job.destination
			flash[:alert] = "Your ship's weak! WIZeek"
			redirect_to new_boat_job_path
		else
			@job.save
		redirect_to boats_path(@boat)
		end

	end

	def edit
		@boat = Boat.find(params[:boat_id])
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
	def destroy
  	# finds user according to their id
  		@job = Job.find(params[:id])
  		if @job.destroy
  			flash[:notice] = "Success"
  		else
  			flash[:alert] = "There was a problem deleting this job."
  		end
  		redirect_to boats_path
	end

	private
	def job_params
		params.require(:job).permit(:job_name, :containers_needed, :cost, :origin, :destination, :cargo)
	end
end
