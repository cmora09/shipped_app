class Job < ActiveRecord::Base
	belongs_to :boat
	validates :job_name, presence: true, length: {maximum: 75}, uniqueness: true
	validates :containers_needed,  presence: true
	validates :cost, presence: true
	validates_numericality_of :cost, :greater_than_or_equal_to => 1000
	validates :origin, presence: true
	validates :destination, presence: true
	validates :cargo, presence: true
	validates :cargo, length: {minimum: 50}
	# validates_presence_of :job_name, :containers_needed, :cost, :origin, :destination, :cargo, on: :create
end
