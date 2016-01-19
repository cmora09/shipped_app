class Location < ActiveRecord::Base
	has_many :boats
	has_many :jobs
	validates :city, presence: true
	validates :country, presence: true
end
