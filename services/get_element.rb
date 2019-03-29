require 'active_support/core_ext/object/blank'
require './errors/error'
require './constants'

class GetElement

    attr_reader :map, :position

    def initialize(position, map)
        @position = position
        @map = map
    end

    def call
        map.blank? ? (raise Error, Constants::ERRORS[:empty_map]) : false
        position.blank? ? (raise Error, Constants::ERRORS[:empty_position]) : false
        map[position[0]][position[1]]
    end
end