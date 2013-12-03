require_relative "../lib/cell"

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

	# it "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do

	# end

end