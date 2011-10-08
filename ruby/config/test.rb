require 'yaml'

yaml = begin
								 YAML.load(File.open("strategy_pairs.yaml"))
				 rescue ArgumentError => e
								  puts "Could not parse YAML: #{e.message}"
				 end

yaml.each_key {|key|
  puts "#{key} and values are #{yaml[key][:ace]}" 
}
