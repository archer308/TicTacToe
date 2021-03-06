

class App
	def initialize
		puts "Welcome to Tic Tac Toe!"
		puts "Who is human, X or O?  "
		choice = STDIN.gets.chomp.downcase
		case choice
		when 'x'
			@human_is_X = true
		when 'o'
			@human_is_X = false
		else
			puts "We'll just make you X..."
			@human_is_X = true
		end
	end

	def run
		puts ""
		
		playerX = @human_is_X ? Human.new('Fry') : AI.new('Bender')
		playerO = @human_is_X ? AI.new('Bender') : Human.new('Fry')

		game = Game.new(
			playerX,
			playerO,
			Board.new
		)
		game.run

		puts "Would you like to play again?  (y/n)"
		choice = STDIN.gets.chomp
		if choice.downcase == 'y'
			run
		end
	end
end
