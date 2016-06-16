class EndGame

	attr_accessor :winning_symbol, :winning_combinations, :player, :computer, :board

	@@winning_combinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

	def initialize(player, computer, board)
		@winning_symbol = "no one"
		@winning_combinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
		@player = player
		@computer = computer
		@board = board
	end

	def run
		filled? || won? ? game_over : false
	end

	def game_over
		won? ? @winning_symbol : "ITS OVER AND NOBODY WON"
	end

	def filled?
		true if no_spaces_left
	end

	def no_spaces_left
		!@board.comp.include?(" ")
	end

	def won?
		decide_winning_sequence
		no_winning_sequence ? false : decide_winner
	end

	def decide_winning_sequence
		@winning_sequence = @winning_combinations.select do |array|
			@board.comp[array[0]] == @board.comp[array[1]] && @board.comp[array[0]] == @board.comp[array[2]] && @board.comp[array[2]]!= " "
		end
	end

	def no_winning_sequence
		@winning_sequence.size == 0
	end

	def decide_winner
		@winning_symbol = @board.comp[@winning_sequence[0][0]]
		true
	end


end