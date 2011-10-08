require File.dirname(__FILE__) + '/' + 'card.rb'

class Deck

  attr_accessor :deck

  def initialize
    @deck = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @deck << Card.new(suit, value)
      end
    end  
  end


  def shuffle!
    @deck.shuffle!
  end 

end
