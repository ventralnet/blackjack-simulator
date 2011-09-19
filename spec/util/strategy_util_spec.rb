require File.dirname(__FILE__) + "/" + '../../app/util/strategy_util.rb'

describe StrategyUtil do

  before(:each) do
	  resources_dir = "#{File.dirname(__FILE__)}/../../resources/test/"
    files = [resources_dir + "strategy.yaml",resources_dir + "strategy_pairs.yaml",resources_dir + "strategy_aces.yaml"]
		@util = StrategyUtil.new files
	end

	it 'should give the correct play based on cards passed' do

	end

end
