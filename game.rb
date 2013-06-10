require "./it.rb"

class Game 
	
	def initialize(listofusers_msg)
		tag = Mark.new
		listofusers#we want a list of users in an array

		#adds all the users into a hash with values of false
		listofusers.each do |x|
			tag.add(x)
		end

		#choose one user to be "it"
		tag.randomizer
		#declares the person who is "it" begins game
		tag.who_is_it
	end

	def begin(msg)

		#only register if input beings with @nick
		#output array of user who said, what the command and if anyuser

		#must partition at 


	end

	def user_commands(msg)

		q=msg.partition(@nick) if msg.includes?(@nick) 
		
		if q[1]=="add" #add. user if user join channel
			tag.add(q[2])
		elsif q[1]=="tag" #switch taged players
			if tag.players.fetch[q[0]]==true
				tag.change_who_is_it(q[0],q[2])
			else
				puts "You are not it."
			end	
		elsif q[1]=="check" #check player
			tag.check(q[2])
		end	
	end	

	def run(msg)
		while true 
			#continously recieve input from server
			# tag.who_is_it
			q = begin(msg)
			if q.include?(@prefix)
				user_commands
			elsif #msgs are server commands
				automated
			elsif q.include? ("join")
				#find joined user in msg
				tag.add(newPlayer)
			elsif q.include? ("left/quit/exit")
				#find user in msg
				tag.remove(user)
			else
			end
		end
		end
	end

end