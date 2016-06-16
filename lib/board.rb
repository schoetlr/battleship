class Board
  attr_reader :grid
  
  def self.default_grid
  	Array.new(10) {Array.new(10)}
  end

  def initialize( grid = Board.default_grid )
  	@grid = grid
  end 

  def display
  	grid.each { |row| p row }
  end

  def [](*pos)
  	if pos.first.is_a?(Array)
  	  row, col = pos[0]
  	else
  	  row, col = pos[0], pos[1]
  	end
  	grid[row][col]
  end

  def count
  	count = 0
    grid.each do |row|
      count += row.count(:s)
    end
    count
  end

  def empty?(*pos)
    if pos.first.is_a?(Array)
      row, col = pos[0]
      return true if grid[row][col] != :s
    elsif pos.first == nil
      return true if count == 0
    end
    false	
  end

  def full?
    return true if grid.all? { |row| row.all? {|pos| pos == :s } }
    false
  end

  def populate_grid
  	ships_placed = 0
  	until ships_placed == (empty_spots.count / 2)
  	  place_random_ship
  	  ships_placed += 1
  	end
  end

  def place_random_ship
    raise "no open spaces" if full?
    row, col = empty_spots.sample
    grid[row][col] = :s
  end

  def won?
  	return true if empty?
  	return false
  end
  
  def empty_spots
  	empty_spots = []
  	grid.each_index do |row|
  	  grid[row].each_index do |col|
        empty_spots << [row, col] if empty?([row, col])
  	  end
  	end
  	empty_spots
  end



end
