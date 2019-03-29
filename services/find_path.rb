require 'require_all'
require 'active_support/core_ext/object/blank'
require './errors/error'
require './constants'
require_all 'services'

class FindPath

    attr_reader :input
    attr_accessor :path

    def initialize(input)
        @input = input
        @path = ''
    end

    def call
        map = CreateMap.new(input).call
        start = FindPosition.new(map, '@').call
        finish = FindPosition.new(map, 'x').call
        start.blank? ? (raise Error, Constants::ERRORS[:no_start]) : false
        finish.blank? ? (raise Error, Constants::ERRORS[:no_finish]) : false
        self.path = GetElement.new(map, start).call
        find_path(map, start, nil)
    end

    private

    def find_path(map, position, last_direction = nil)
        direction = FindNextDirection.new(map, position, last_direction).call
        next_position = MoveToNextPosition.new(position, direction).call
        element = GetElement.new(map, next_position).call
        self.path = "#{self.path}#{element}"
        element == 'x' ? (return self.path) : false
        find_path(map, next_position, direction)
    end

end
