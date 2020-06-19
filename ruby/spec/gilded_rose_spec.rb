require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  context 'When selling item is not Aged Brie or Sulfuras' do

    before :each do
      item_degradable = [Item.new('Elixir', 3, 8)]
      @gilded_rose = GildedRose.new(item_degradable)
      
    end

    it 'should be able to denote item in quality by -1' do
      expect(@gilded_rose.update_quality().first.quality).to eq 7
    end

    it 'should be able to denote item in value by -1' do
      expect(@gilded_rose.update_quality().first.sell_in).to eq 2
    end
  end

end
