require 'item'

describe Item do

  it 'should be able to return item as a string in a specific format' do
    item = Item.new('Aged Brie', 5, 2)
    expect(item.to_s()).to eq 'Aged Brie, 5, 2'
  end

end