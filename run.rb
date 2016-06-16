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
		loop do
			PlayerMove.new(player, board).run
			break if EndGame.new(player, cpu, board).run != false
			ComputerMove.new(cpu, board).run
			break if EndGame.new(player, cpu, board).run != false
		end
	end

	def add_stats(player, board, cpu)
		result = EndGame.new(player, cpu, board).run
		AddStats.new(player, cpu, result).run
	end

end

Runner.new.run 