class Board
	attr_reader :height, :width
	attr_accessor :all_cells, :live_cells

	def initialize(height, width)
		@height = height
		@width = width
		@all_cells = []
		
	end

	def create
		height.times { all_cells << [] }
		all_cells.each do |empty_nest|
			width.times {empty_nest << Cell.new}
		end
	end

	def starting_move!(array)
		@live_cells = starter(array)
		live_cells.each do |coordinates|
			all_cells[coordinates.y][coordinates.x].state = "alive"
		end
	end

	Living = Struct.new(:y, :x)
	def starter(array)
		array.collect do |item|
			Living.new(item[0], item[1])
		end
	end

end