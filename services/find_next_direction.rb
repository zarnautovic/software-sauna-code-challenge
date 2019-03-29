require './constants'
require 'active_support/core_ext/object/blank'
require './errors/error'

#deciding the next move
class FindNextDirection
    #including constants module to have access to created constatns in ./constants.rb (directions and error messages) 
    include Constants

    attr_reader :map, :current_position, :previous_direction

    #previous direction can be nil because of start point
    def initialize(map, current_position, previous_direction = nil)
        @map = map
        @current_position = current_position
        @previous_direction = previous_direction
    end

    def call
        #validation
        is_blank?(map, :empty_map)
        is_blank?(current_position, :current_empty)
        #calculating next move
        direction = direction(define_posible_direcitons, previous_direction)
        #raise error exception if direction is invalid
        (direction == false || direction.blank?) ? (raise Error, Constants::ERRORS[:invalid_direction]) : direction
    end

    private

    #regarding on current position removing invalid moves
    def define_posible_direcitons
        #taking our DIRECTION constant and putting it to var so it can be modifiled
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

    #deciding next direction
    def direction(posible_directions, previous_direction)
        #desiding next direction based on previous direction
        same_direction?(posible_directions, previous_direction) ? (return previous_direction) : false
        (posible_directions[:left] and !map[current_position[0]][current_position[1]-1].blank?) ? (return Constants::DIRECTIONS[:left]) : false
        (posible_directions[:right] and !map[current_position[0]][current_position[1]+1].blank?) ? (return Constants::DIRECTIONS[:right]) : false
        (posible_directions[:up] and !map[current_position[0]-1][current_position[1]].blank?) ? (return Constants::DIRECTIONS[:up]) : false
        (posible_directions[:down] and !map[current_position[0]+1][current_position[1]].blank?) ? (return Constants::DIRECTIONS[:down]) : false
    end

    #keep moving in previous direction if it is possible
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