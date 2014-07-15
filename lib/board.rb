

class Board

	EDGES = [0, 2, 6, 8]
	CORNERS = [1, 3, 5, 7]
	CENTER = 4
	WINNING_SCORE = 12

	def initialize
		@board = [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]
	end



	def draw
		puts <<-EOS
The Board:
#{@board[7]} #{@board[0]} #{@board[5]}
#{@board[2]} #{@board[4]} #{@board[6]}
#{@board[3]} #{@board[8]} #{@board[1]}
EOS
	end

	def dropPiece( spot )
		if spotOpen?( spot )
			p = 'X'
			if getXPieces( ).count > getOPieces( ).count
				then p = 'O'
			end
			@board[spot] = p
			return true
		end
	  false
	end

	def spotOpen?( spot )
		return @board[spot].is_a? Integer
	end

	def getXPieces
		return @board.each_index.select{ |i| @board[i] == 'X' }
	end

	def getOPieces
		return @board.each_index.select{ |i| @board[i] == 'O' }
	end

	def getAllPieces
		return @board.each_index.select{ |i| @board[i].is_a? String }
	end


	def getCurrentPlayerPieces
		if getXPieces().count > getOPieces().count
			return getOPieces
		end
		return getXPieces
	end

	def getOtherPlayerPieces
		if getXPieces().count > getOPieces().count
			return getXPieces
		end
		return getOPieces
	end

	def getOpenSpots
		return @board.each_index.select{ |i| @board[i].is_a? Integer}
	end

	def xWins?
		if win( getXPieces )
			return true
		end
		return false
	end

	def oWins?
		if win( getOPieces )
			return true
		end
		return false
	end

	def drawGame?
		if not xWins? and not oWins? and full?
			return true
		end
		return false
	end

	def full?
		if getOpenSpots( ).count < 1
			return true
		end
		return false
	end

	def empty?
		if getOpenSpots( ).count == 9
			return true
		end
		return false
	end





	private
	def win( pieces )
		if( pieces.length < 3 ) then return false end

		# We search for any 3 integers that total to 12 in an array of arbitrary length.
		# This approach might be a bit extreme, but it should always work.
		# 
		# This would be "n(scary) but fast enough in practice" as they say,
		#     since our array will always be short.
		for a in 0..pieces.length-3
			for b in a+1..pieces.length-2
				for c in b+1..pieces.length-1
					if( pieces[a] + pieces[b] + pieces[c] == WINNING_SCORE )
						return true;
					end
				end
			end
		end

		return false
	end

end

