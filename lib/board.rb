class Board
	attr_reader :height, :width
	attr_accessor :all_cells, :live_cells, :to_die, :to_live

	def initialize(height, width)
		@height = height
		@width = width
		@all_cells = create
		@to_die = []
		@to_live = []
	end

	def create
		array = []
		height.times { array << [] }
		array.each do |empty_nest|
			width.times {empty_nest << Cell.new}
		end
		array
	end

	def starting_move!(array)
		@live_cells = coordinates(array)
		live_cells.each do |coordinate|
			all_cells[coordinate.y][coordinate.x].state = "alive"
		end
	end

	def tick!
		to_die.each { |cell_to_kill| cell_to_kill.die! }
		to_live.each { |cell_to_live| cell_to_live.live!}
	end

	Position = Struct.new(:y, :x)
	def coordinates(array)
		array.collect do |item|
			Position.new(item[0], item[1])
		end
	end

end