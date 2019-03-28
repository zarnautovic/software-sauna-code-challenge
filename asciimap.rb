
map = File.open(ARGV[0], 'r') {|f| f.read}
@maparray = map.split("\n").map { |row| row.split('') }
@path = ''
@position = nil
@last_move = nil

def find_position(array, character)
    array.each_with_index do |item, index|
        result = []
        if item.index(character)
            return [index, item.index(character)]
        end
    end
end

def define_first_movement(start, maparray)
    right = get_right_neighbor(start, maparray)
    left = get_left_neighbor(start, maparray)
    top = get_top_neigbor(start, maparray)
    bottom = get_bottom_neighbor(start, maparray)

    if !right.nil? && !right.empty?
        @last_move = 'right'
    elsif !left.nil? && !left.empty?
        @last_move = 'left'
    elsif !top.nil? && !top.empty?
        @last_move = 'top'
    elsif !bottom.nil? && !bottom.empty?
        @last_move = 'bottom'
    end
end

def get_right_neighbor(position, maparray)
    maparray[position[0]][position[1]+1]
end

def get_left_neighbor(position, maparray)
    maparray[position[0]][position[1]-1]
end

def get_top_neigbor(position, maparray)
    maparray[position[0]-1][position[0]]
end

def get_bottom_neighbor(position, maparray)
    maparray[position[0]+1][position[0]]
end

def next_move_position(maparray)
    puts @last_move
    if @last_move == 'right'
        right = get_right_neighbor(@position, maparray)
        if !right.nil? && !right.empty?
            @last_move = 'right'
            @position = [@position[0], @position[1]+1]
            @path << right
        else
            top = get_top_neigbor(@position, maparray)
            bottom = get_bottom_neighbor(@position, maparray)
            if !top.nil? && !top.empty?
                @last_move = 'top'
            elsif !bottom.nil? && !bottom.empty?
                @last_move = 'bottom'
            end
        end
    else
        return
    end

    next_move_position(maparray)
end

@start = find_position(@maparray, '@')
@finish = find_position(@maparray, 'x')

@position = @start
@path << @maparray[@position[0]][@position[1]]
define_first_movement(@position, @maparray)
next_move_position(@maparray)
puts @path


puts @maparray[-1][6]
