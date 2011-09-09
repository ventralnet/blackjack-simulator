require File.dirname(__FILE__) + "/" + '../../app/models/card.rb'

describe Card do

  it 'should correct tell if its an ace or not' do
    card = Card.new(:spades,:ace)
    card.is_ace?.should be_true
    card = Card.new(:spades,10)
    card.is_ace?.should be_false
  end

  context 'face_value should work' do

    it 'should return 1 or 11 if the card is an ace' do
      card = Card.new(:spades,:ace)
      card.face_value.should eq([1,11])
    end 

    it 'should return value for none face cards' do
      card = Card.new(:spades, 10)
      card.face_value.should eql([10])
    end

    it 'should return 10 for face cards' do
      king = Card.new(:spades,:king)
      queen = Card.new(:spades,:queen)
      jack = Card.new(:spades,:jack)
      king.face_value.should eq([10])
      queen.face_value.should eq([10])
      jack.face_value.should eq([10])
    end 

  end

end
