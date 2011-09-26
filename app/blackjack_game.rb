require File.dirname(__FILE__) + "/models/" + 'shoe.rb'
require File.dirname(__FILE__) + "/models/" + 'blackjack_hand.rb'
require File.dirname(__FILE__) + "/util/" + 'strategy_util.rb'
require 'yaml'



num_hands = 100000
shoe = Shoe.new 6
shoe.shuffle!
bet_size = 5

strategies = StrategyUtil.load_strategies


playerWins = 0
dealerWins = 0

num_hands.times  {
  dealerHand = BlackjackHand.new shoe.deal_card, shoe.deal_card  
  playerHand = BlackjackHand.new shoe.deal_card, shoe.deal_card
  
  dealerShowCard = dealerHand.hand[0]
  dealerShowCardValue = dealerShowCard.face_value[0] unless dealerShowCard.is_ace?
  dealerShowCardValue = :ace unless !dealerShowCard.is_ace?

#  puts "Dealers hand : #{dealerShowCard.to_s}"
#  puts "Players hand : #{playerHand.to_s}"
#  strategyKey = playerHand.get_strategy_key.to_sym
#  puts "Strategy key : #{strategyKey.to_s}"
#  if (strategies[strategyKey].nil?)
#  puts "User should  : hit"
#  elsif
#  puts "User should  : #{strategies[strategyKey][dealerShowCardValue].to_s}"
#  end


  dealerWins = dealerWins + 1 unless dealerHand.hand_value < playerHand.hand_value
  playerWins = playerWins + 1 unless playerHand.hand_value < dealerHand.hand_value

  shoe.burn_cards
}
 
puts "Dealer wins: #{dealerWins.to_s}   Player wins: #{playerWins.to_s}"
puts "#{playerWins.fdiv dealerWins} player win percentage"


