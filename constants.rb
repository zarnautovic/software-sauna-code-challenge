module Constants
    DIRECTIONS = {:left => 'left', :right => 'right', :up => 'up', :down => 'down'}.freeze

    ERRORS = {
        :empty_map => 'map is empty',
        :current_empty => 'current position is empty',
        :invalid_direction => 'direction is invalid or empty',
        :empty_input => 'input is empty',
        :no_start => 'no start position',
        :no_finish => 'no end position',
        :empty_position => 'position is empty',
        :empty_direction => 'direction is empty',
}.freeze
end