class Player

	attr_accessor :name, :symbol, :stats

	def initialize
		@stats = {wins: 0, losses: 0, draws: 0}
		@symbol = "none"
	end

end