class Card
 
  #value => 1,2,3,4,5,6,7,8,9,10,jack,queen,king,ace
  attr_accessor :value, :suit

  VALUES = [1,2,3,4,5,6,7,8,9,10,:jack,:queen,:king,:ace]
  SUITS = [:spade,:diamond,:club,:heart] 
 
  def initialize suit, value
    @suit = suit
    @value = value
  end
 
  def is_ace?
    :face_value.count == 2
  end

  def to_s
    "#{@value} #{@suit}"
  end
end
