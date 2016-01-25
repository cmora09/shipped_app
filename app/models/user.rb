class User < ActiveRecord::Base
	has_many :boats, dependent: :destroy
	has_many :follows 
	has_many :followed, through: :follows, source: :boat
	has_many :jobs
	has_secure_password
	validates_uniqueness_of :username, case_sensitive: false
	validates_confirmation_of :password
	validates_presence_of :password, :fname, :lname, :email, on: :create
	has_attached_file :avatar, :styles =>
		{ :medium => "300x300>", :thumb => "100x100>" },
		:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	#has_many :followedships, through: ships, 

end
