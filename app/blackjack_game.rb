require File.dirname(__FILE__) + "/models/" + 'blackjack_hand.rb'
require File.dirname(__FILE__) + "/models/" + 'shoe.rb'
require 'yaml'


def load_strategies
  strat1 = YAML.load(File.open("#{File.dirname(__FILE__)}/../config/strategy.yaml"))
  strat2 = YAML.load(File.open("#{File.dirname(__FILE__)}/../config/strategy_aces.yaml"))
  strat3 = YAML.load(File.open("#{File.dirname(__FILE__)}/../config/strategy_pairs.yaml"))

  strat1.merge!(strat2).merge!(strat3)
end



puts load_strategies

