class Mark

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

end

q = Mark.new

player = gets.chomp

q.add(player)

q.check(player)