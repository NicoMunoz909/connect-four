require_relative 'cell.rb'

class Board

  attr_reader :cells

  def initialize
    @cells = [ [Cell.new(0,0), Cell.new(0,1), Cell.new(0,2), Cell.new(0,3), Cell.new(0,4), Cell.new(0,5)],
               [Cell.new(1,0), Cell.new(1,1), Cell.new(1,2), Cell.new(1,3), Cell.new(1,4), Cell.new(1,5)],
               [Cell.new(2,0), Cell.new(2,1), Cell.new(2,2), Cell.new(2,3), Cell.new(2,4), Cell.new(2,5)],
               [Cell.new(3,0), Cell.new(3,1), Cell.new(3,2), Cell.new(3,3), Cell.new(3,4), Cell.new(3,5)],
               [Cell.new(4,0), Cell.new(4,1), Cell.new(4,2), Cell.new(4,3), Cell.new(4,4), Cell.new(4,5)],
               [Cell.new(5,0), Cell.new(5,1), Cell.new(5,2), Cell.new(5,3), Cell.new(5,4), Cell.new(5,5)],
               [Cell.new(6,0), Cell.new(6,1), Cell.new(6,2), Cell.new(6,3), Cell.new(6,4), Cell.new(6,5)] ]
  end

  def place_disc(column,value)
    return false if self[column][5].value != nil
    index = self[column].index {|cell|  cell.value == nil}
    self[column][index].value = value
  end

  def board_full?
    for i in 0...self.cells.length
      for j in 0...self[i].length
        return false if self[i][j].value == nil
      end
    end
    return true
  end

  def game_over?

    value = nil
    counter = 0

    return true if self.board_full?

    #Vertical
    for x in 0..6
      value = self[x][0].value
      counter = 1
      for y in 1..5
        if self[x][y].value == value && self[x][y].value != nil
          counter += 1
        elsif self[x][y].value != nil
          value = self[x][y].value
          counter = 1
        else
          counter = 0
        end
        break if counter == 4
      end
      break if counter == 4
    end

    return true if counter == 4

    #Horizontal
    for y in 0..5
      value = self[0][y].value
      counter = 1
      for x in 1..6
        if self[x][y].value == value && self[x][y].value != nil
          counter += 1
        elsif self[x][y].value != nil
          value = self[x][y].value
          counter = 1
        else
          counter = 0
        end
        break if counter == 4
      end
      break if counter == 4
    end

    return true if counter == 4

    #Diagonal
    diagonals = [
                  [self[0][2],self[1][3],self[2][4],self[3][5]],
                  [self[0][1],self[1][2],self[2][3],self[3][4],self[4][5]],
                  [self[0][0],self[1][1],self[2][2],self[3][3],self[4][4],self[5][5]],
                  [self[1][0],self[2][1],self[3][2],self[4][3],self[5][4],self[6][5]],
                  [self[2][0],self[3][1],self[4][2],self[5][3],self[6][4]],
                  [self[3][0],self[4][1],self[5][2],self[6][3]],
                  [self[0][3],self[1][2],self[2][1],self[2][0]],
                  [self[0][4],self[1][3],self[2][2],self[3][1],self[4][0]],
                  [self[0][5],self[1][4],self[2][3],self[3][2],self[4][1],self[5][0]],
                  [self[1][5],self[2][4],self[3][3],self[4][2],self[5][1],self[6][0]],
                  [self[2][5],self[3][4],self[4][3],self[5][2],self[6][1]],
                  [self[3][5],self[4][4],self[5][3],self[6][2]]
                ]
    for i in 0...diagonals.length
      value = diagonals[i][0].value
      counter = 1
      for j in 1...diagonals[i].length
        if diagonals[i][j].value == value && diagonals[i][j].value != nil
          counter += 1
        elsif diagonals[i][j].value != nil
          value = diagonals[i][j].value
          counter = 1
        else
          counter = 0
        end
        break if counter == 4
      end
      break if counter == 4
    end

    return counter == 4

  end

  def [](i)
    @cells[i]
  end

  def to_s
   return "
           #{self[0][5].representation} #{self[1][5].representation} #{self[2][5].representation} #{self[3][5].representation} #{self[4][5].representation} #{self[5][5].representation} #{self[6][5].representation} 
           #{self[0][4].representation} #{self[1][4].representation} #{self[2][4].representation} #{self[3][4].representation} #{self[4][4].representation} #{self[5][4].representation} #{self[6][4].representation} 
           #{self[0][3].representation} #{self[1][3].representation} #{self[2][3].representation} #{self[3][3].representation} #{self[4][3].representation} #{self[5][3].representation} #{self[6][3].representation} 
           #{self[0][2].representation} #{self[1][2].representation} #{self[2][2].representation} #{self[3][2].representation} #{self[4][2].representation} #{self[5][2].representation} #{self[6][2].representation} 
           #{self[0][1].representation} #{self[1][1].representation} #{self[2][1].representation} #{self[3][1].representation} #{self[4][1].representation} #{self[5][1].representation} #{self[6][1].representation} 
           #{self[0][0].representation} #{self[1][0].representation} #{self[2][0].representation} #{self[3][0].representation} #{self[4][0].representation} #{self[5][0].representation} #{self[6][0].representation}
           \u2460 \u2461 \u2462 \u2463 \u2464 \u2465 \u2466
          "
  end

end
