class Cell
	attr_accessor :state, :neighbors
	attr_reader :row, :column

	def initialize(state="dead")
		@state = state
		@neighbors = []
	end

	def find_neighbors(board)
		find_position(board)
		does_neighbor_exist(board, row-1, column-1)
		does_neighbor_exist(board, row-1, column)
		does_neighbor_exist(board, row-1, column+1)
		does_neighbor_exist(board, row, column-1)
		does_neighbor_exist(board, row, column+1)
		does_neighbor_exist(board, row+1, column-1)
		does_neighbor_exist(board, row+1, column)
		does_neighbor_exist(board, row+1, column+1)
	end

	def does_neighbor_exist(board, neighbor_row, neighbor_column)
		return if board.all_cells[neighbor_row] == nil
		if board.all_cells[neighbor_row][neighbor_column] == nil
			return 
		else
			location = board.all_cells[neighbor_row][neighbor_column]
		end
		neighbors << location if location.state == "alive"
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

	def under_population(board)
		board.to_die << self if self.state == "alive" && neighbors.count < 2
	end

	def overcrowding(board)
		board.to_die << self if self.state == "alive" && neighbors.count > 3
	end

	def zombify(board)
		board.to_live << self if self.state == "dead" && neighbors.count == 3
	end

	def stagnate(board)
		if neighbors.count == 2
			board.to_live << self if state == "alive"
			board.to_die << self if state == "dead"
		end
	end

	def evaluate_cell(board)
		find_neighbors(board)
		under_population(board)
		overcrowding(board)
		zombify(board)
	end

end

