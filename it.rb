class Mark

	attr_accessor :add, :remove, :who_is_it, :check, :change_who_is_it

	def initialize 
		@players = Hash.new
	end

	def add(user)
		@players[user] = false
	end

	def remove(user)
		@players.delete(user)
	end	

	def who_is_it
		puts "User: #{@players.key(true)}"
	end

	def check(user)
		if @players.fetch(user) == true
			puts "User: #{user} is IT"
		elsif @players.fetch(user) == false
			puts "User: #{user} NOT IT"
		else 
			puts "Who the fuck are you looking for?"
		end
	end

	def change_who_is_it(it,new_it)
		@players[it] = false
		@players[new_it] = true
	end

	def tag_player(user)
		@players[user] = true
	end

	def randomizer
		#choose random value from hash and output

	end


end

