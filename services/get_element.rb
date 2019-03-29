require 'active_support/core_ext/object/blank'
require './errors/error'
require './constants'

#taking element from array on  given location/coordinates
class GetElement

    attr_reader :map, :position

    def initialize(map, position)
        @map = map
        @position = position
    end

    def call
        is_blank?(map, :empty_map)
        is_blank?(position, :empty_position)
        map[position[0]][position[1]]
    end

    private
    
    #hellper function for validation input
    def is_blank?(var, error_code)
        var.blank? ? (raise Error, Constants::ERRORS[error_code]) : false
    end
end