#!/usr/bin/env ruby -wKU

class Database

	attr_accessor :database

	def initialize
		@database = []
	end

	def add_user(user)
		if user.is_a?(Hash)
			if @database.include? user
				return false
			else
				@database << user
				return true
			end
		end
	end

	def delete_user(user)
		@database.delete(user){"user does not exist"}
	end

	def find_user(user)
		0.upto(@database.size-1) do |x|
			if @database[x][:user] == user
				return @database[x]
			end
		end
		return false
	end

	# def find_user_with_lastname(lastname)
	# 	0.upto(@database.size-1) do |x|
	# 		if @database[x][:lastname] == lastname
	# 			return @database[x]
	# 		end
	# 	end
	# 	return false
	# end

	# def find_email(attribute)
	# 	0.upto(@database.size-1) do |x|
	# 		if @database[x].values.include? attribute
	# 			return @database[x][:email]
	# 		end
	# 	end
	# end

	def modify_user(attribute, hashkey, newvalue)
		if find_user(attribute)
			user = find_user(attribute)
			user[hashkey] = newvalue
		else
			return false
		end
		
	end
	
end


class User

	attr_accessor :user, :temp

	def initialize
		@user = {:user => nil,
				 :tagstate => nil,
				}
	end

	def convert_input_to_hash(input)
		user = {}
		if input.length==5
			user[:user] = input[0]
			user[:tagstate] = input[1]
			# user[:email] = input[2]
			# user[:phone] = input[3]
			# user[:note] = input[4]
			# return user
		end
		return false
	end


end
