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
        is_blank?(current_position, :current_empty)
        Constants::DIRECTIONS[:left] == direction ? (return [current_position[0], current_position[1]-1]) : false
        Constants::DIRECTIONS[:right] == direction ? (return [current_position[0], current_position[1]+1]) : false
        Constants::DIRECTIONS[:up] == direction ? (return [current_position[0]-1, current_position[1]]) : false
        Constants::DIRECTIONS[:down] == direction ? (return [current_position[0]+1, current_position[1]]) : false
        raise Error, Constants::ERRORS[:invalid_direction]
    end

    private
    
    def is_blank?(var, error_code)
        var.blank? ? (raise Error, Constants::ERRORS[error_code]) : false
    end
end