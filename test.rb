require	"./it.rb"
require "./game.rb"


def test
	users=['ruff','chuckles','yolo','mlgswag','madmax','dumkoff']
	tag = Mark.new
	tag.add(users)
	puts tag.players
	tag.check('ruff')
	tag.tag_player('mlgswag')
	puts tag.who_is_it
	tag.change_who_is_it('mlgswag','ruff')
	puts tag.who_is_it
	puts tag.check('chuckles')
	puts tag.check('ruff')
end

test

#hash cannot input array
#methods add hash keys when you call them even for checking