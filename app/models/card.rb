class Card
 
  #value => 1,2,3,4,5,6,7,8,9,10,jack,queen,king,ace
  attr_accessor :value, :suit

  VALUES = [2,3,4,5,6,7,8,9,10,:jack,:queen,:king,:ace]
  SUITS = [:spade,:diamond,:club,:heart] 
 
  def initialize suit, value
    @suit = suit
    @value = value
  end
 
  def is_ace?
     return @value == :ace
  end
 
  def face_value
    if is_ace? 
      [1,11]
    elsif (@value == :jack || @value == :queen || @value == :king)
      [10]
    else
      [@value]
    end
  end

  def to_s
    "#{@value}" #{@suit}"
  end
end
