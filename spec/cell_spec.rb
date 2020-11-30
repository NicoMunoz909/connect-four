require './lib/cell.rb'

describe Cell do

  describe "#initialize" do

    it "Correctly initializes coords" do
      cell = Cell.new(1,4)
      expect(cell.x).to eql(1)
      expect(cell.y).to eql(4)
    end

    it "Initializes cell value to nil" do
      cell = Cell.new(1,5)
      expect(cell.value).to eql(nil)
    end

  end

end