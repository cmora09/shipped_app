class User < ActiveRecord::Base
	has_many :boats, dependent: :destroy
	has_many :jobs
	has_secure_password
	validates_uniqueness_of :username, case_sensitive: false
	validates_confirmation_of :password
	validates_presence_of :password, :fname, :lname, :email, on: :create
end
