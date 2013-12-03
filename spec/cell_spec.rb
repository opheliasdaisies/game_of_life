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

	it "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
		
	end

end