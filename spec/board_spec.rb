require_relative "../lib/board"
require_relative "../lib/cell"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

describe "Board" do

	it "Creates a board with a dead cell in each position" do
		board = Board.new(3,4)
		board.all_cells[0][0].state.should eq("dead")
	end

	it "Creates a board with a dead cell in each position" do
		board = Board.new(3,4)
		board.all_cells[2][3].state.should eq("dead")
	end

	it "Changes starting positions to 'alive'" do
		board = Board.new(3,4)
		board.starting_move!([[1,1],[2,1]])
		board.all_cells[1][1].state.should eq("alive")
	end

	it "Refreshes the board with the new set of live/dead cells" do
		board = Board.new(3,3)
		board.starting_move!([1,1])
		board.tick
		cell = "alive"
		cell.state.should eq("dead")
	end

end