#!/usr/bin/env ruby

require 'test/unit'
require	"../it.rb"
# require "../game.rb"

class Test < Test::Unit::TestCase 
	def setup
		users=['ruff','chuckles','yolo','mlgswag','madmax','dumkoff']
		tag = Mark.new
	end
	def test_adding_users
		tag.add("Mark")

	end
	
		
		# tag.check('ruff')
		# tag.tag_player('mlgswag')
		# puts tag.who_is_it
		# tag.change_who_is_it('mlgswag','ruff')
		# puts tag.who_is_it
		# puts tag.check('chuckles')
		# puts tag.check('ruff')

end

#use database crm tdd for this