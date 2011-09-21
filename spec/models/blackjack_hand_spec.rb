require File.dirname(__FILE__) + "/" + '../../app/models/blackjack_hand.rb'

describe BlackjackHand do

  context 'hand_value' do
    it 'should score face cards correctly' do
    
    end

    it 'should score an ace hand to the most advantageous value (1 or 11)' do

    end
  end

  it 'should construct with the two initial hand cards' do

    card_one = Card.new(:diamond,1)
    card_two = Card.new(:spade,1)
    card_three = Card.new(:spade,5)
   

    blackjack_hand = BlackjackHand.new(card_one,card_two)
    hand = blackjack_hand.hand
 
    hand.index(card_one).should_not be_nil  
    hand.index(card_two).should_not be_nil
    hand.index(card_three).should be_nil

  end

  context 'get_strategy_key' do
    before(:all) do
      @five = Card.new :spade,5
      @five2 = Card.new :diamond,5
      @ace = Card.new :diamond,:ace
      @four = Card.new :diamond,4
    end


    it 'should return the correct key given an ace hand' do
      hand = BlackjackHand.new @ace, @four
      hand.get_strategy_key.should eql("A4")
		end

		it 'should return the correct key given a pair hand' do
      hand = BlackjackHand.new @five, @five2
      hand.get_strategy_key.should eql("55")  
		end

		it 'should return the correct key given an ace with two face cards that add under 10' do
      hand = BlackjackHand.new @five, @ace
      hand << @four
      hand.get_strategy_key.should eql("A9")
		end


	end	


  context 'hand_value' do
    it 'should handle blackjack correctly' do
      ace_card = Card.new(:diamond,:ace)
      face_card = Card.new(:spade,:king)
      open_card = Card.new(:club,5)
 
      hand = BlackjackHand.new ace_card,face_card
      hand.hand_value.should eq(21)
    end
 
    it 'should handle 21 correctly' do
      ace_card = Card.new(:diamond,:ace)
      ten_card = Card.new(:spade,:king)
      ten_card2 = Card.new(:club, :queen)

      hand = BlackjackHand.new ace_card,ten_card
      hand << ten_card2 
 
      hand.hand_value.should eq(21)
    end

    it 'should handle two aces' do
      ace_card = Card.new(:diamond,:ace)
      ace_card2 = Card.new(:spade,:ace)
      open_card = Card.new(:club,2)
      
      hand = BlackjackHand.new ace_card,ace_card2
      hand << open_card
     
      hand.hand_value.should eq(14)
    end
 
    it 'should use ace for best score' do
      ace_card = Card.new(:diamond,:ace)
      five = Card.new(:spade,5)
      two = Card.new(:club, 2)

      hand = BlackjackHand.new five, two
      hand << ace_card

      hand.hand_value.should eq(18) 
    end
  end 
end
