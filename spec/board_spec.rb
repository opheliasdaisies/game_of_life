require_relative "../lib/board"

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
		World.new(3,4).should eq[[dead,dead,dead],[dead,dead,dead],[dead,dead,dead],[dead,dead,dead]]
	end

end