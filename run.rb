require "pry"
require_relative "environment.rb"

class Runner

	def run
		board = Board.new
		player = Player.new
		cpu = Computer.new
		prep = Prep.new(player, cpu).run

		loop do
			take_turns(player, board, cpu)
			add_stats(player, board, cpu)
			break if !Ask.new.run
			board = Board.new
		end
	end

	def take_turns(player, board, cpu)
		until EndGame.new(player, cpu, board).run != false
			PlayerMove.new(player, board).run
			ComputerMove.new(cpu, board).run
		end
	end

	def add_stats(player, board, cpu)
		result = EndGame.new(player, cpu, board).run
		AddStats.new(player, cpu, result).run
	end

end

Runner.new.run 