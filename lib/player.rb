class HumanPlayer
  def get_play
  	puts "What row would you like to attack?(starts at 0)"
  	row = gets.chomp.to_i
  	puts "What column would you like to attack?(starts at 0)"
  	col = gets.chomp.to_i
  	[row, col]
  end
end
