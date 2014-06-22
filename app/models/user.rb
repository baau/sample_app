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
	before_save :encrypt_password 

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
		
	end

	# This is a class level method 
	#syntax 1 
	# def User.authenticate
	# end 
	#Syntax 2 
	class << self
		def authenticate (email,submitted_password)
			user = find_by_email(email)
			return nil if user.nil?
			return user if user.has_password?(submitted_password)
			
		end
	end 

	private 

		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypt_password = encrypt(self.password)

		end 

		def encrypt(string)
			#string  # not the final implementation
			secure_hash("#{salt}--#{string}")

			
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
			
		end

		def make_hash
			secure_hash("#{Time.now.utc}--#{password}")
			
		end

		
end
