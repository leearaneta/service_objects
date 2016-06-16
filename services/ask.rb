class Ask

	def run
		puts "wanna play again?? yes or no"
		answer = gets.chomp
		until answer == "yes" || answer == "no"
			puts "what"
			answer = gets.chomp
		end
		answer == "yes" ? true : false
	end

end
