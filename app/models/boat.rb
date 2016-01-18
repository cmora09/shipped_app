class Boat < ActiveRecord::Base
	belong_to :user
	has_many :jobs
end
