require 'item'

class GildedRose
  attr_reader :items
  def initialize(items)
    @items = items
  end

  AGED_BRIE = 'Aged Brie'
  SULFARAS = 'Sulfuras, Hand of Ragnaros'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  CONJURED = 'Conjured'

  def update_quality()
    @items.each do |item|
    reduce_quality_regular_item(item) if validates_if_regular?(item)
    aged_brie(item) if item.name == AGED_BRIE
    backstage(item) if item.name == BACKSTAGE_PASSES
    reduce_quality_conjured_item(item) if item.name == CONJURED

    reduce_sell_in(item) if item.name != SULFARAS
    end
  end

  private

  def reduce_sell_in(item)
    item.sell_in -= 1
  end

  def reduce_quality_regular_item(item)
    manage_item_quality(item, 1) if item.sell_in >= 0
    manage_item_quality(item, 2) if item.sell_in < 0
  end

  def reduce_quality_conjured_item(item)
    manage_item_quality(item, 2)
  end

  def validates_if_regular?(item)
    item.name != AGED_BRIE && item.name != SULFARAS && item.name != BACKSTAGE_PASSES && item.name != CONJURED
  end

  def aged_brie(item) 
    item.quality < 50 ? item.quality += 1 : item.quality = 50
  end

  def backstage(item)
    item.quality += 1 if item.sell_in > 10
    item.quality += 2 if item.sell_in <= 10 && item.sell_in > 5
    item.quality += 3 if item.sell_in <= 5 && item.sell_in >= 0
    item.quality = 0 if item.sell_in < 0
  end

  def manage_item_quality(item, value)
    item.quality -= value if item.quality > 0
    item.quality = 0 if item.quality <= 0
  end
end
