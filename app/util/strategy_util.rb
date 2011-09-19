require File.dirname(__FILE__) + "/../" + "models" +  "/" + 'card.rb'
require 'yaml'

class StrategyUtil

  def initialize(files)
	  @strategy_table = Hash.new
    files.each { |file|
		  @strategy_table.merge! YAML.load(File.open(file)) 
		}
  end

	def get_play(cards)
    aces = @hand.reject { |card| card.value != :ace }
	  non_aces = @hand.reject { |card| card.value == :ace }


	end
end
