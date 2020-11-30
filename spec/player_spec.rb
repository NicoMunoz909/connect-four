require './lib/player.rb'

describe Player do

  player = Player.new("Red player","Red")
  
  describe "#Initialize" do
    
    it "Creates a player with a name" do
      expect(player.name).to eql("Red player")
    end

    it "Creates a player with a color" do
      expect(player.color).to eql("Red")
    end
  end

end