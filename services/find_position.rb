#find position of given element
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
                #returning location of element as array [0,0]
                return [index, item.index(element)]
            end
        end
        #return nil if there is no element in array
        nil
    end

    private

    #validation function where we are checking is first and second dimension array typr
    def is_array?(array)
        !array.kind_of?(Array) ? (raise Error, Constants::ERRORS[:invalid_array]) : false
    end
end