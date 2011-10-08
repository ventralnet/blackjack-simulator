require File.dirname(__FILE__) + "/" + '../../app/models/deck.rb'

describe Deck do

  before (:each) do 
    @deck = Deck.new
  end

  it 'should contain 52 cards' do
    @deck.deck.count.should eq(52)
  end

  it 'should shuffle cards when shuffle! is called' do
    #technically a shuffle run could keep the first card in the same position, assume this is not the case
    firstCard = @deck.deck[0]
    @deck.shuffle!
    postFirstCard = @deck.deck[0]
    firstCard.should_not  eql(postFirstCard)
  end

end
