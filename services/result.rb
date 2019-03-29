require './services/find_path'

class Result

    attr_reader :input

    def initialize(input)
        @input = input
    end

    def call
        #calling find path service
        path = FindPath.new(input).call

        #extracting letters from string with regular expresion in ruby [A-Z]
        letters = path.scan /\p{Upper}/
        #concatenating letters back to string
        puts "Letters " << letters.join('')
        puts "Path as characters " << path
    end
end