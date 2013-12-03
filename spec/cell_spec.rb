require_relative "../lib/cell"
require_relative "../lib/board"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

describe "Cell" do

	it "Should create a cell with a state of dead if value is not passed into initialize" do
		cell = Cell.new
		cell.state.should eq("dead")
	end

	it "Should create a cell with a state of alive if alive value is passed into initialize" do
		cell = Cell.new("alive")
		cell.state.should eq("alive")
	end

	it "Should know what its position is in the array" do
		board = Board.new(3,3)
		cell = board.all_cells[1][1]
		cell.find_position(board)
		cell.position.should eq([1,1])
	end

	it "Should detect the neighbor to the north-west" do
		board = Board.new(3,3)
		board.starting_move!([[1,1],[0,0]])
		cell = board.all_cells[1][1]
		cell.find_neighbors(board)
		neighbors.count.should eq(1)
	end

	# it "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do

	# end

end