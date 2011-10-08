require File.dirname(__FILE__) + "/" + '../../app/util/strategy_util.rb'
require File.dirname(__FILE__) + "/" + '../../app/models/blackjack_hand.rb'
require File.dirname(__FILE__) + "/" + '../../app/models/card.rb'

describe StrategyUtil do
 
  it 'should work' do
#[17]    [] playerhand[7 diamond10 heart] dealerShow[10 club]
    
    playerHand = BlackjackHand.new(Card.new(:diamond, 7), Card.new(:heart, 10))
    dealerHand = BlackjackHand.new(Card.new(:club, 10), Card.new(:heart,2))    

    strats = StrategyUtil.load_strategies
  end

end
