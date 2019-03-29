class FindPosition
    attr_reader :map, :element

    def initialize(map, element)
        @map = map
        @element = element
    end

    def call
        is_array?(map)
        map.each_with_index do |item, index|
           is_array?(item)
            if item.index(element)
                return [index, item.index(element)]
            end
        end
        nil
    end

    private

    def is_array?(array)
        !array.kind_of?(Array) ? (raise Error, Constants::ERRORS[:invalid_array]) : false
    end
end