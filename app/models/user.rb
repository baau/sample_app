class User < ActiveRecord::Base
	# this shows that only these "name","email" columns are editable by the
	# end user 
	attr_accessible :name,:email
end
