require_relative "./lib/board"
require_relative "./lib/cell"


def visualize(array)
	array.each do |row|
		row.each do |cell|
			print "O" if cell.state == "alive"
			print "." if cell.state == "dead"
		end
		puts
	end
	puts
	puts
end


starting_array = [[4,4],[4,5],[4,7],[5,4],[5,5],[6,6]]
game = Board.new(10, 15)
game.starting_move!(starting_array)
visualize(game.all_cells)
5.times do
	game.evaluate_all
	game.tick!
	visualize(game.all_cells)
end
