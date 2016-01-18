class Job < ActiveRecord::Base
	belongs_to :boat
	validates_presence_of :job_name, :containers_needed, :user_id, :boat_id, :cost, :origin, :destination, :cargo
end
