class Player

  attr_reader :color, :name

  def initialize(name,color)
    @name = name
    @color = color
  end

  def drop_disc(board,column)
    board.place_disc(column, @color)
  end
    
end