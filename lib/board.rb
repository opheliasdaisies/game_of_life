class Board
	attr_reader :height, :width
	attr_accessor :all_cells

	def initialize(height, width)
		@height = height
		@width = width
		@all_cells = []
	end

	def create
		height.times do
			all_cells << []
		end
		all_cells.each do |empty_nest|
			width.times {empty_nest << Cell.new}
		end
	end

end