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
      item_degradable_sell_by_pass = [Item.new('Elixir Sell By Pass', 0, 8)]
      @gilded_rose = GildedRose.new(item_degradable)
      @gilded_rose_sell_by_pass = GildedRose.new(item_degradable_sell_by_pass)
    end

    it 'should be able to denote item in quality by -1' do
      expect(@gilded_rose.update_quality().first.quality).to eq 7
    end

    it 'should be able to denote item in value by -1' do
      expect(@gilded_rose.update_quality().first.sell_in).to eq 2
    end

    context 'Once the sell by date has passed' do

      it 'should be able to denote item in quality by -2' do
        expect(@gilded_rose_sell_by_pass.update_quality().first.quality).to eq 6
      end
    end

  end

  context 'When selling item is Aged Brie' do

    before :each do
      item_degradable = [Item.new('Aged Brie', 3, 1)]
      @gilded_rose = GildedRose.new(item_degradable)
    end

    it 'should be able to denote item in quality by +1' do
      expect(@gilded_rose.update_quality().first.quality).to eq 2
    end

    it 'should be able to denote item in value by -1' do
      expect(@gilded_rose.update_quality().first.sell_in).to eq 2
    end
  end

end
