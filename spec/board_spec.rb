require './lib/board.rb'

describe Board do

  board = Board.new

  describe "#initialize" do

    it "creates a 7x6 board" do
      expect(board.cells.length).to eql(7)
      for i in 0...board.cells.length
        expect(board[i].length).to eql(6)
      end
    end

    it "cells are of class Cell" do
      for i in 0...board.cells.length
        for j in 0...board[i].length
          expect(board[i][j].class).to eql(Cell)
        end
      end
    end

  end

  describe "#Place_disc" do

    it "Places the disc in the correct column" do
      board.place_disc(2,"Red")
      expect(board[2][0].value).to eql("Red")
    end

    it "Places the disc in the last empty space" do
      board.place_disc(3,"Red")
      board.place_disc(3,"Yellow")
      board.place_disc(3,"Red")
      for i in 0..2
        expect(board[3][i].value).to_not eql(nil)
      end
    end

  end

  describe "#game_over?" do

    it "Returns false is there is no winner" do
      expect(board.game_over?).to eql(false)
    end

    it "Works correctly on vertical lines" do
      board[2][0].value = "Red"
      board[2][1].value = "Red"
      board[2][2].value = "Red"
      board[2][3].value = "Red"
      expect(board.game_over?).to eql(true)
    end

    it "Works correctly on horizontal lines" do
      board[2][0].value = "Red"
      board[3][0].value = "Red"
      board[4][0].value = "Red"
      board[5][0].value = "Red"
      expect(board.game_over?).to eql(true)
    end

    it "Works correctly on diagonal lines" do
      board[0][0].value = "Red"
      board[1][1].value = "Red"
      board[2][2].value = "Red"
      board[3][3].value = "Red"
      expect(board.game_over?).to eql(true)
    end

  end

end