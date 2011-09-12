require File.dirname(__FILE__) + "/" + 'card.rb'


class BlackjackHand

  attr_accessor :hand

  def initialize initCard1, initCard2
    @hand = Array.new
    @hand << initCard1 << initCard2
  end
 
  def << rhs
    @hand << rhs
  end

  def accept_card card
    @hand << card
  end

  def hand_value
    #grab aces
    aces = @hand.reject { |card| card.value != :ace }
    non_aces = @hand.reject { |card| card.value == :ace }

    nonAceSum = non_aces.inject(0) { |sum, card| 
      if (card.value.kind_of? Fixnum)
        sum+card.value 
      else
        sum + 10
      end
    }
    return nonAceSum unless aces.count > 0
    sum = aces.inject(nonAceSum) { |running_sum,card|
      if running_sum + 11 <= 21
        running_sum + 11
      else
        running_sum + 1
      end
    }

    return sum
  end

end

