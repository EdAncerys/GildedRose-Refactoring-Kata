require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  context 'when selling item is Conjured' do 

  end

  context 'when selling item is Backstage passes' do 

    before :each do
      item_backstage = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 10)]
      @gilded_rose_backstage = GildedRose.new(item_backstage)
    end

    it 'should be able to denote backstage item in quality by +1' do
      expect(@gilded_rose_backstage.update_quality().first.quality).to eq 11
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

    it 'should be able to denote item in sell_in by -1' do
      expect(@gilded_rose.update_quality().first.sell_in).to eq 2
    end

    it 'the quality of an item should be never negative' do
      10.times { @gilded_rose.update_quality() }

      expect(@gilded_rose.update_quality().first.quality).to eq 0
    end

    context 'Once the sell by date has passed' do

      it 'should be able to denote item in quality by -2' do
        4.times { @gilded_rose.update_quality() }

        expect(@gilded_rose.update_quality().first.quality).to eq 2
      end
    end

  end

  context 'When selling item is Aged Brie' do

    before :each do
      item_aged_brie = [Item.new('Aged Brie', 30, 40)]
      @gilded_rose_aged_brie = GildedRose.new(item_aged_brie)
    end

    it 'should be able to denote item in quality by +1' do
      expect(@gilded_rose_aged_brie.update_quality().first.quality).to eq 41
    end

    it 'should not be able to denote item in quality by over 50' do
      10.times { @gilded_rose_aged_brie.update_quality() }
      expect(@gilded_rose_aged_brie.update_quality().first.quality).to eq 50
    end

    it 'should be able to denote item in sell_in by -1' do
      expect(@gilded_rose_aged_brie.update_quality().first.sell_in).to eq 29
    end
  end

  context 'When selling item is Sulfuras' do

    before :each do
      sulfaras = [Item.new('Sulfuras, Hand of Ragnaros', 100, 80)]
      @gilded_rose_sulfaras = GildedRose.new(sulfaras)
    end

    it 'should not dentoe in quality' do
      expect(@gilded_rose_sulfaras.update_quality().first.quality).to eq 80
    end
  end

end
