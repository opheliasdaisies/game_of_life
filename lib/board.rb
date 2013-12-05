class Board
	attr_reader :height, :width
	attr_accessor :all_cells, :live_cells, :new_cells

	def initialize(height, width)
		@height = height
		@width = width
		@all_cells = create
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

	def evaluate_all
		all_cells.each do |row|
			row.each {|cell| cell.evaluate_cell(self)}
		end	
	end

	def tick!
		evaluate_all
		@new_cells = []
		all_cells.each do |row|
			empty_nest = []
			row.each do |cell|
				to_die.each do |cell_to_die|
					cell.die! if cell == cell_to_die
				end
				to_live.each do |cell_to_live|
					cell.live! if cell == cell_to_live
				end
				empty_nest << cell
			end
			new_cells << empty_nest
		end
		# to_die.map { |cell_to_kill| cell_to_kill.die! }
		# to_live.map { |cell_to_live| cell_to_live.live! }
		# self
		all_cells = new_cells
	end

	Position = Struct.new(:y, :x)
	def coordinates(array)
		array.collect do |item|
			Position.new(item[0], item[1])
		end
	end

end