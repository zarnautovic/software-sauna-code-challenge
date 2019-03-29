require 'require_all'
require_all 'services'

#Set application rrot for easy reference
APP_ROOT = File.dirname(__FILE__)

input = File.open(ARGV[0], 'r') {|f| f.read}
Result.new(input).call

