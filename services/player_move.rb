class PlayerMove

	attr_accessor :player, :board, :move

	def initialize(player, board)
		@player = player
		@board = board
	end

	def run
		set	
		puts "#{@player.name}'s turn"
		@board.display
	end

	def set
		@move = 0
		puts "pick 1-9"
		@move = gets.chomp.to_i
		until valid?
			puts "wrong answer"
			@move = gets.chomp.to_i
		end
		@board.comp[@move - 1] = @player.symbol
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