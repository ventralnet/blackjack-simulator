require File.dirname(__FILE__) + "/" + '../../app/models/shoe.rb'

describe Shoe do

  it 'should deal cards correctly' do

    shoe = Shoe.new(1)

    cards = []
    cards << shoe.deal_card << shoe.deal_card

    shoe.shoe.count.should eq(50)


    shoe.burn_cards 

    shoe.used_cards.count.should eq(2)

    shoe.dealt_cards.count.should eq(0)
  end

  it 'should reshuffle shoe correctly' do
    shoe = Shoe.new(1)

    cards = []
    
    51.times do
      shoe.deal_card
    end
 
    shoe.shoe.count.should eq(1)
    shoe.deal_card
    shoe.shoe.count.should eq(0)
    shoe.burn_cards
    shoe.deal_card
    shoe.shoe.count.should eq(51)
  end
end
