class Prep

	def initialize(player, computer)
		@player = player
		@computer = computer
	end

	def run
		human_name
		human_symbol
		computer_symbol
		[@player, @computer]
	end

	def human_name
		puts "whats ur name lol"
		@player.name = gets.chomp
	end

	def human_symbol
		puts "that's a good name, what's your symbol? X or O"
		choose_symbol
		puts "Your symbol is #{@player.symbol}!"
	end

	def choose_symbol
		@player.symbol = gets.chomp.upcase
		loop do
			break if @player.symbol == "X" || @player.symbol == "O"
			puts "wrong answer"
			@player.symbol = gets.chomp.upcase
		end
	end

	def computer_symbol
		@player.symbol == "X" ? @computer.symbol = "O" : @computer.symbol = "X"
	end

end