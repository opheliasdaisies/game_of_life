class Cell
	attr_accessor :state, :neighbors
	attr_reader :position

	def initialize(state="dead")
		@state = state
		@neighbors = []
	end

	def find_neighbors(board)
		find_position(board)
		row = position[0] -1
		column = position[1] -1
		if board.all_cells[row][column].state == "alive"
			neighbors << board.all_cells[row][column]
		end
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

