class Cell
	attr_accessor :state, :neighbors
	attr_reader :row, :column

	def initialize(state="dead")
		@state = state
		@neighbors = []
	end

	def find_neighbors(board)
		find_position(board)
		if board.all_cells[row-1][column-1].state == "alive"
			neighbors << board.all_cells[row][column]
		end
		if board.all_cells[row-1][column].state == "alive"
			neighbors << board.all_cells[row][column]
		end
		if board.all_cells[row-1][column+1].state == "alive"
			neighbors << board.all_cells[row][column]
		end
		if board.all_cells[row][column-1].state == "alive"
			neighbors << board.all_cells[row][column]
		end
		if board.all_cells[row][column+1].state == "alive"
			neighbors << board.all_cells[row][column]
		end
		if board.all_cells[row+1][column-1].state == "alive"
			neighbors << board.all_cells[row][column]
		end
		if board.all_cells[row+1][column].state == "alive"
			neighbors << board.all_cells[row][column]
		end
		if board.all_cells[row+1][column+1].state == "alive"
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
		@row = coords[0]
		@column = coords[1]
	end

	def die!
		self.state = "dead"
	end

	def live!
		self.state = "alive"
	end

end

