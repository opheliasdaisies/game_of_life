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
		board.create
		board.all_cells[0][0].state.should eq("dead")
	end

	it "Creates a board with a dead cell in each position" do
		board = Board.new(3,4)
		board.create
		board.all_cells[2][3].state.should eq("dead")
	end

	it "Allows array of starting positions to be called by x and y" do
		board = Board.new(3,4,[[1,2],[0,3]])
		array_y = []
		array_x = []
		board.live_cells.each do |position|
			array_y << position.y
			array_x << position.x
		end
		[array_y,array_x].should eq([[1,0],[2,3]])
	end

	it "Changes starting positions to 'alive'" do
		board = Board.new(3,4,[[1,1],[1,3]])
		board.create
		board.starting_move!(live_cells)
		all_cells[1,1].state.should eq("alive")
	end



end