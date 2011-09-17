require 'yaml'

yaml = begin
								 YAML.load(File.open("strategy.yaml"))
				 rescue ArgumentError => e
								  puts "Could not parse YAML: #{e.message}"
				 end

yaml.each_key {|key|
  puts "#{key} and values are #{yaml[key][7]}" 
}

puts
puts
puts
puts

#class Test

#	def initialize
#  @my_hash = {:a9 => {:5 => 'stay',:8 => 'hit'}}
#	 @b = "hello"
#	end

#end

#puts Test.new.to_yaml

a = { :a => {:b => :test, :c => :ace}}

puts a.to_yaml

