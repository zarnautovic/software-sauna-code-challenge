class Result

    attr_reader :input

    def initialize(input)
        @input = input
    end

    def call
        path = FindPath.new(input).call
        letters = path.scan /\p{Upper}/
        puts "Letters " << letters.join('')
        puts "Path as characters " << path
    end
end