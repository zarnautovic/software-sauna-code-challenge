require './constants'
require 'active_support/core_ext/object/blank'
require './errors/error'

class FindNextDirection
    include Constants

    attr_reader :map, :current_position, :previous_direction

    def initialize(map, current_position, previous_direction = nil)
        @map = map
        @current_position = current_position
        @previous_direction = previous_direction
    end

    def call
        is_blank?(map, :empty_map)
        is_blank?(current_position, :current_empty)
        direction = direction(define_posible_direcitons, previous_direction)
        (direction == false || direction.blank?) ? (raise Error, Constants::ERRORS[:invalid_direction]) : direction
    end

    private

    def define_posible_direcitons
        posible_directions = Constants::DIRECTIONS.dup if Constants::DIRECTIONS.frozen?
        current_position[0] == 0 ? posible_directions.delete(:up) : false
        current_position[1] == 0 ? posible_directions.delete(:left) : false
        previous_direction == 'left' ? posible_directions.delete(:right) : false
        previous_direction == 'right' ? posible_directions.delete(:left) : false
        previous_direction == 'up' ? posible_directions.delete(:down) : false
        previous_direction == 'down' ? posible_directions.delete(:up) : false
        current_position[0]+1 >= map.length ? posible_directions.delete(:down) : false
        posible_directions
    end

    def direction(posible_directions, previous_direction)
        same_direction?(posible_directions, previous_direction) ? (return previous_direction) : false
        (posible_directions[:left] and !map[current_position[0]][current_position[1]-1].blank?) ? (return Constants::DIRECTIONS[:left]) : false
        (posible_directions[:right] and !map[current_position[0]][current_position[1]+1].blank?) ? (return Constants::DIRECTIONS[:right]) : false
        (posible_directions[:up] and !map[current_position[0]-1][current_position[1]].blank?) ? (return Constants::DIRECTIONS[:up]) : false
        (posible_directions[:down] and !map[current_position[0]+1][current_position[1]].blank?) ? (return Constants::DIRECTIONS[:down]) : false
    end

    def same_direction?(posible_directions, previous_direction)
        (posible_directions.key(previous_direction) == :left and !map[current_position[0]][current_position[1]-1].blank?) ? (return true) : false
        (posible_directions.key(previous_direction) == :right and !map[current_position[0]][current_position[1]+1].blank?) ? (return true) : false
        (posible_directions.key(previous_direction) == :up and !map[current_position[0]-1][current_position[1]].blank?) ? (return true) : false
        (posible_directions.key(previous_direction) == :down and !map[current_position[0]+1][current_position[1]].blank?) ? (return true) : false
    end
    
    def is_blank?(var, error_code)
        var.blank? ? (raise Error, Constants::ERRORS[error_code]) : false
    end
end