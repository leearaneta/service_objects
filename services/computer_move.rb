class ComputerMove

	def initialize(computer, board)
		@computer = computer
		@board = board
	end

	def run
		set
		puts "computer's turn"
		@board.display
	end

	def set
		@move = 0
		until valid?
			@move = rand(1..9)
		end
		@board.comp[@move - 1] = @computer.symbol
	end

	def valid?
		true if space_is_blank && move_within_bounds
	end

	def space_is_blank
		@board.comp[@move - 1] == " "
	end

	def move_within_bounds
		@move >= 1 && @move <= 9
	end

end