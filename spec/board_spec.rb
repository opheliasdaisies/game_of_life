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

	it "Should contain an array of the cells that should become alive" do
		board = Board.new(3,3)
		board.starting_move!([[1,1]])
		board.evaluate_all
		board.to_live.should eq([])
	end

	it "Should contain an array of the cells that should become dead" do
		board = Board.new(3,3)
		board.starting_move!([[1,1]])
		cell = board.all_cells[1][1]
		board.evaluate_all
		board.to_die.should eq([cell])
	end

	it "Should contain an array of the cells that should become alive" do
		board = Board.new(3,3)
		board.starting_move!([[0,2],[1,0],[1,1]])
		board.evaluate_all
		board.to_live.should eq([board.all_cells[0][1]])
	end

	it "Should contain an array of the cells that should become dead" do
		board = Board.new(3,3)
		board.starting_move!([[0,2],[1,0],[1,1]])
		board.evaluate_all
		board.to_die.should eq([board.all_cells[0][2], board.all_cells[1][0]])
	end

	it "Refreshes the board with the new set of live/dead cells" do
		board = Board.new(3,3)
		board.starting_move!([[1,1]])
		board.evaluate_all
		board.tick!
		cell = board.all_cells[1][1]
		cell.state.should eq("dead")
	end

	it "Refreshes the board with the new set of live/dead cells" do
		board = Board.new(4,4)
		board.starting_move!([[0,0],[0,2],[0,3],[1,1],[1,2],[1,3],[2,2]])
		board.evaluate_all
		board.tick!
		cells_to_be_alive = []
		board.all_cells.each do |row|
			row.each do |cell|
				if cell.state == "alive"
					cells_to_be_alive << cell 
				end
			end
		end
		cells_to_be_alive.count.should eq(4)
	end


end