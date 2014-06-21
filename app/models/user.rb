# Table name : User

# id			: integer 		not null,priamry key
# name 		: string(255)
# email		: string(255)
# created_at 	: datetime
# updated_at   : datetime




class User < ActiveRecord::Base
	# this shows that only these "name","email" columns are editable by the
	# end user
	attr_accessor  :password 
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates :name,:presence => true,
			  :length => {:maximum => 50}
	validates :email,:presence => true,
			  :format => {:with => email_regex},
			  :uniqueness => {:case_sensitive => false}
	validates :password,:presence => true,
			  :confirmation => true,
			  :length => {:within => 6..40}
end
