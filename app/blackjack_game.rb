require File.dirname(__FILE__) + "/models/" + 'shoe.rb'
require File.dirname(__FILE__) + "/models/" + 'blackjack_hand.rb'
require File.dirname(__FILE__) + "/util/" + 'strategy_util.rb'
require 'yaml'

class BlackjackGame
 
  attr_accessor :num_losses,:num_wins,:num_pushes,:total_winnings

  def initialize num_hands, bet_size, shoe_size
    @strategies = StrategyUtil.load_strategies
    @num_hands = num_hands
    @bet_size = bet_size
    @shoe = Shoe.new shoe_size
    @num_losses = 0
    @num_wins = 0
    @num_pushes = 0
    @total_winnings = 0
  end
 
  def play_game
    @num_hands.times  {
      dealerHand = BlackjackHand.new @shoe.deal_card, @shoe.deal_card  
      playerHand = BlackjackHand.new @shoe.deal_card, @shoe.deal_card
      
      play_hand(dealerHand, playerHand,@bet_size)
    
      @shoe.burn_cards
    }
  end
  
  def to_s
    "NumWins: [#{@num_wins}], NumLosses: [#{@num_losses}], NumPushes: [#{@num_pushes}], TotalWinnings: [#{@total_winnings}] \n Win/Loss: [#{@num_wins/@num_losses.to_f}]"
  end

  def dp dealerHand, playerHand
    "Playerhand #{playerHand}=#{playerHand.hand_value}  Dealerhand: #{dealerHand}=#{dealerHand.hand_value}"
  end

  def dps dealerHand, playerHand
    "Playerhand #{playerHand}=#{playerHand.hand_value}  Dealerhand: #{dealerHand.hand[0]}"
  end
  private
  def play_hand dealerHand, playerHand, curr_bet_size
    puts "Playing hand... #{dps dealerHand, playerHand}"
    show_card = dealerHand.hand[0]

    if (playerHand.hand_value > 21)
      puts "BUSTED! #{dp dealerHand, playerHand}" 
      @num_losses = @num_losses + 1
      @total_winnings = @total_winnings - curr_bet_size
      return nil
    elsif playerHand.hand_value == 21 && playerHand.hand.count == 2
      if dealerHand.hand_value == 21
        puts "PUSH! #{dp dealerHand, playerHand}"
        @num_pushes = @num_pushes + 1
      elsif
        puts "BLACKJACK! #{dp dealerHand, playerHand}"
        @num_wins = @num_wins + 1
        @total_winnings = @total_winnings + (curr_bet_size * 3/2.to_f)
      end
      return nil
    end
  
    strat = playerHand.get_strategy show_card,@strategies
    hand_result = nil 
    if (strat == :split)
      puts "SPLITTING #{dps dealerHand, playerHand}"
      play_hand(dealerHand, BlackjackHand.new(playerHand.hand[0], @shoe.deal_card), curr_bet_size)
      play_hand(dealerHand, BlackjackHand.new(playerHand.hand[1], @shoe.deal_card), curr_bet_size) 
    elsif strat == :double || (strat == :doublestand && playerHand.hand.count == 2)
      puts "DOUBLING"
      playerHand << @shoe.deal_card 
      curr_bet_size = curr_bet_size * 2
      hand_result = finish_hand dealerHand, playerHand 
    elsif strat == :hit
      puts "HITTING #{dps dealerHand,playerHand}"
      playerHand << @shoe.deal_card
      play_hand(dealerHand,playerHand,curr_bet_size)
    elsif strat == :stay || (strat == :doublestand && playerHand.hand.count > 2)
      puts "STAY #{dps dealerHand, playerHand}"
      hand_result = finish_hand dealerHand, playerHand
    end

    if (hand_result == :win)
      puts "WIN! #{dp dealerHand, playerHand}"
      @num_losses = @num_losses + 1
      @total_winnings = @total_winnings - curr_bet_size
    elsif hand_result == :loss
      puts "LOSS! #{dp dealerHand, playerHand}"
      @num_wins = @num_wins + 1
      @num_losses = @num_losses + 1
      @total_winnings = @total_winnings - curr_bet_size
    elsif hand_result == :push
      puts "PUSH! #{dp dealerHand, playerHand}"
      @num_pushes = @num_pushes + 1
    end

    puts "------------------------------------------------------------"
  end

  def finish_hand dealerHand, playerHand
    #deal to dealer to hard 17
    until dealerHand.hand_value >= 17 && !dealerHand.is_soft? 
      dealerHand << @shoe.deal_card
    end

    if playerHand.hand_value > dealerHand.hand_value
      return :win
    elsif playerHand.hand_value == dealerHand.hand_value
      return :push
    else
      return :loss
    end
  end

end


b = BlackjackGame.new 100000, 5, 6

b.play_game

puts b.to_s
