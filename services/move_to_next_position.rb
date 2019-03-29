require 'active_support/core_ext/object/blank'
require './constants'
require './errors/error'

class MoveToNextPosition
    include Constants

    attr_reader :current_position, :direction

    def initialize(current_position, direction)
        @current_position = current_position
        @direction = direction
    end

    def call
        current_position.blank? ? (raise Error, Constants::ERRORS[:current_empty]) : false
        Constants::DIRECTIONS[:left] == direction ? (return [current_position[0], current_position[1]-1]) : false
        Constants::DIRECTIONS[:right] == direction ? (return [current_position[0], current_position[1]+1]) : false
        Constants::DIRECTIONS[:up] == direction ? (return [current_position[0]-1, current_position[1]]) : false
        Constants::DIRECTIONS[:down] == direction ? (return [current_position[0]+1, current_position[1]]) : false
        raise Error, Constants::ERRORS[:invalid_direction]
    end
end