class FindPosition
    attr_reader :map, :element

    def initialize(map, element)
        @map = map
        @element = element
    end

    def call
        map.each_with_index do |item, index|
            if item.index(element)
                return [index, item.index(element)]
            end
        end
        nil
    end
end