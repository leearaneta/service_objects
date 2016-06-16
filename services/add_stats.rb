class AddStats

	def initialize(player, computer, result)
		@player = player
		@computer = computer
		@result = result
	end

	def run
		@result == "ITS OVER AND NOBODY WON" ? add_draw : add_win_or_loss
		puts @player.stats
	end

	def add_draw
		@player.stats[:draws] += 1 
		puts @result
	end

	def add_win_or_loss
		if find_winner == @player
			@player.stats[:wins] += 1
			puts "good job lmao"
		else
			@player.stats[:losses] += 1
			puts "good try loser"
		end
	end

	def find_winner
		[@player, @computer].find { |gamer| gamer.symbol == @result}
	end

end