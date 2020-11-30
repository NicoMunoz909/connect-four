require_relative 'lib/board.rb'
require_relative 'lib/player.rb'
require_relative 'lib/cell.rb'

board = Board.new
redP = Player.new("Red player", "Red")
yellowP = Player.new("Yellow player", "Yellow")


while true
  print "Red player turn. Choose where to drop your disc (1-7)"
  column = gets.chomp.to_i
  redP.drop_disc(board,column-1)
  puts board
  break if board.game_over?
  print "Yellow player turn. Choose where to drop your disc (1-7)"
  column = gets.chomp.to_i
  yellowP.drop_disc(board,column-1)
  puts board
  break if board.game_over?
end
