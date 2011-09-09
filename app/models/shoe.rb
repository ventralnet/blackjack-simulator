require File.dirname(__FILE__) + "/" + 'deck.rb'

class Shoe

  attr_accessor :shoe

  #initialize pass in number of decks defaults to 1
  def initialize num_decks = 1
    @shoe = []
    num_decks.times do
      @shoe.concat(Deck.new.deck)
    end

  end

  def shuffle!
    @shoe.shuffle!
  end
 
end

s = Shoe.new 6
puts s.shoe[0]
s.shuffle!
puts s.shoe[0]
