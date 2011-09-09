require File.dirname(__FILE__) + "/" + 'card.rb'


class BlackjackHand

  attr_accessor :hand

  def initialize initCard1, initCard2

  end

end

b = BlackjackHand.new Card.new(5,:spade), Card.new(3,:heart)
