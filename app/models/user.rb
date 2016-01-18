class User < ActiveRecord::Base
	has_many :boats
	validates_presence_of :username, :password, :fname, :lname, :email,
end
