require 'item'

class GildedRose
  attr_reader :items
  def initialize(items)
    @items = items
  end

  AGED_BRIE = 'Aged Brie'
  SULFARAS = 'Sulfuras, Hand of Ragnaros'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'

  def update_quality()
    @items.each do |item|

      reduce_quality(item) if validates_if_regular?(item)
      aged_brie(item) if item.name == AGED_BRIE
 
      reduce_sell_in(item) if item.name != SULFARAS
      
    end
  end

  private

  def reduce_sell_in(item)
    item.sell_in -= 1
  end

  def reduce_quality(item)
    quality_label(item, 1) if item.sell_in >= 0
    quality_label(item, 2) if item.sell_in < 0
  end

  def validates_if_regular?(item)
    item.name != AGED_BRIE && item.name != SULFARAS && item.name != BACKSTAGE_PASSES
  end

  def aged_brie(item) 
    item.quality < 50 ? item.quality += 1 : item.quality = 50
  end

  def quality_label(item, value)
    item.quality -= value if item.quality > 0
    item.quality = 0 if item.quality <= 0
  end
end
