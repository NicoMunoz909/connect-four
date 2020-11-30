class Cell

  attr_reader :x, :y, :value, :representation

  def initialize(x,y)
    @x = x
    @y = y
    @value = nil
    @representation = "\e[#{29}m\u25EF\e[0m"
  end

  def value=(value)
    @value = value
    red = "\e[#{31}m\u2B24\e[0m"
    yellow = "\e[#{33}m\u2B24\e[0m"
    empty = "\e[#{29}m\u25EF\e[0m"
    case value
    when "Red"
      @representation = red
    when "Yellow"
      @representation = yellow
    else
      @representation = empty
    end
  end

  def to_s
    "[#{@x},#{@y}] Value: #{@value}"
  end

end