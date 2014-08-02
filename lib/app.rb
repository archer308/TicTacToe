

class App
	def initialize
		puts "Welcome to Tic Tac Toe!"
		puts "Who is human, #{Board::PLAYER_ONE_TOKEN} or #{Board::PLAYER_TWO_TOKEN}?  "
		choice = STDIN.gets.chomp.upcase
		case choice
		when Board::PLAYER_ONE_TOKEN
			@human_is_X = true
		when Board::PLAYER_TWO_TOKEN
			@human_is_X = false
		else
			puts "We'll just make you #{Board::PLAYER_ONE_TOKEN}..."
			@human_is_X = true
		end
	end

	def run
		puts ""
		
		playerX, playerO = create_players()

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

	private
	def create_players
		human = Human.new('Fry')
		computer = AI.new('Bender')
		if @human_is_X
			player_x = human
			player_o = computer
		else
			player_x = computer
			player_o = human
		end
		[player_x, player_o]
	end
end
