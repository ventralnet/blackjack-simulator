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

  def is_pair?
    if @hand.count == 2 && @hand[0].value == @hand[1].value
      return true
    else
      return false
    end
  end

  def hand_value
    #grab aces
    nonAceSum = get_non_ace_sum
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

	def get_strategy_key
		non_ace_sum = get_non_ace_sum

		if aces.count == 1 && non_ace_sum <= 9
      return "A#{non_ace_sum}".to_sym
		elsif non_aces.count == 2
      return non_ace_sum.to_s.to_sym unless non_aces[0].value == non_aces[1].value
			return "#{non_aces[0].face_value[0]}#{non_aces[1].face_value[0]}".to_sym
	  else
      return hand_value.to_s.to_sym
		end
	end

  def get_strategy dealer_show_card, strategy_table
    strat_key = get_strategy_key
 
    strat_set = strategy_table[strat_key]

    dealer_key = nil
    if (dealer_show_card.is_ace?)
      dealer_key = :ace
    else
      dealer_key = dealer_show_card.face_value[0].to_s.to_sym
    end 
    suggested_play = strat_set[dealer_key]
    if @hand.count > 2 && suggested_play == :double
      suggested_play = :hit 
    end
    return suggested_play
  end

  def to_s
    rtrn = ""
    @hand.each do |currCard|
      rtrn = rtrn + currCard.to_s
    end 
    return rtrn
  end
	
  private
	def get_non_ace_sum
		non_aces = @hand.reject { |card| card.value == :ace }			
    non_aces.inject(0) { |sum, card|
      if (card.value.kind_of? Fixnum)
		    sum+card.value
		  else
		    sum + 10
		  end
		}
  end

	def aces
    @hand.reject { |card| card.value != :ace }
	end

	def non_aces
	  @hand.reject { |card| card.value == :ace }
	end

end

