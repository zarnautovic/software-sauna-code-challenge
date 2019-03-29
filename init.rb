require './services/result'

#read input from terminal
input = File.open(ARGV[0], 'r') {|f| f.read}
#calling result service
Result.new(input).call

