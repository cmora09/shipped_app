class User < ActiveRecord::Base
	has_many :boats dependent: :destroy
	has_many :jobs
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :username, :password, :fname, :lname, :email, :on :create
end
