require 'active_support/core_ext/object/blank'
require './errors/error'
require './constants'

class CreateMap

    attr_reader :input

    def initialize(input)
        @input = input
    end

    def call
        input.blank? ? (raise Error, Constants::ERRORS[:empty_input]) : input.split("\n").map { |row| row.split('') }
    end
end