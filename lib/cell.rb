class Cell
	attr_accessor :state, :neighbors
	attr_reader :position

	def initialize(state="dead")
		@state = state
		@neighbors = []
	end

	def find_neighbors(board)
		
	end

	def find_position(board)
		coords = []
		board.all_cells.each do |row|
			row.each do |cell|
				if cell == self
					coords << board.all_cells.index(row)
					coords << row.index(cell)
				end
			end
		end
		@position = coords
	end

end

