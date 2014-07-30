

class App
	def initialize
		puts "Welcome to Tic Tac Toe!"
		puts "Who is human, #{Board::PLAYER_X_TOKEN} or #{Board::PLAYER_O_TOKEN}?  "
		choice = STDIN.gets.chomp.upcase
		case choice
		when Board::PLAYER_X_TOKEN
			@human_is_X = true
		when Board::PLAYER_O_TOKEN
			@human_is_X = false
		else
			puts "We'll just make you #{Board::PLAYER_X_TOKEN}..."
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
