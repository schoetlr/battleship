require_relative 'board'
require_relative 'player'

class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
  	@player = player
  	@board = board
  end

  def attack(pos)
  	row, col = pos
  	board.grid[row][col] = :x
  end

  def count
  	board.count
  end

  def game_over?
  	board.won?
  end

  def play_turn
    attack(player.get_play)
  end

  def play
  	board.populate_grid
  	until game_over?
  	  board.display
  	  puts "there are #{count} ships remaining"
  	  play_turn
  	end
  end

end


if __FILE__ == $PROGRAM_NAME
  game = BattleshipGame.new(HumanPlayer.new, Board.new)
  game.play
end
