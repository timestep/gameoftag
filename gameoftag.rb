#!/bin/env ruby
#encoding: utf-8

require "socket"
require "./it.rb"
require "./game.rb"

class Bot

	attr_accessor :getmsg, :@channel, :@prefix, :@nick, :@s

	server = "irc.freenode.net"
	port = "6667"
	@nick = "gameofTag"
	@channel = "#timestep"
	@prefix = "PRIVMSG #{@channel} :"
	

	@s = TCPSocket.open(server, port)
	@s.puts "USER testing 0 * Testing"
	@s.puts "NICK #{@nick}"
	@s.puts "JOIN #{@channel}"
	@s.puts "#{@prefix}Hello from Game of Tag Bot"

#### The user list is seperated by spaces. Use the alicebot to remove them with the partiiton
	gameofTag = Game.new(@s.puts "NAMES [#{@channel}]")	

	def getmsg
		msg = @s.puts
		puts msg
	end
	
	until @s.eof? do
	 	
	  	gameofTag.run(getmsg)


	end 



end

