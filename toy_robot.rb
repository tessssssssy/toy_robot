class Robot
    attr_reader :north, :east, :face
    def initialize(north, east, face)
        @north = north
        @east = east
        @face = face
    end

    def rotate_right
        case @face
        when "NORTH"
            @face = "EAST"
        when "EAST"
            @face = "SOUTH"
        when "SOUTH"
            @face = "WEST"
        else
            @face = "NORTH"
        end
    end

    def rotate_left
        case @face
        when "NORTH"
            @face = "WEST"
        when "WEST"
            @face = "SOUTH"
        when "SOUTH"
            @face = "EAST"
        else
            @face = "NORTH"
        end
    end

    def move
        case @face
        when "NORTH"
            @north += 1 unless @north == 4
        when "EAST"
            @east += 1 unless @east == 4
        when "SOUTH"
            @north -= 1 unless @north == 0
        else 
            @east -= 1 unless @east == 0
        end
    end

    def report
        puts "Coordinates:(#{@east}, #{@north}, #{@face})"
    end
end

# class PlayRobot
#     def run_program
#         if 
#     end
# end


# robot = Robot.new(0, 0, "EAST")

# chomped = []
# commands.each do |command|
#     chomped << command.chomp
# end
# p chomped

# make sure first command is correct format
def check_first_command(command)
    arr_1 = command.split(' ') #only one space
    return false if arr_1.length != 2
    return false if arr_1[0] != 'PLACE'
    command_arr = command.split(' ').join(',').split(',')
    directions = ["NORTH", "EAST", "SOUTH", "WEST"]
    coords = ['0', '1','2','3','4'] # using strings because to_i converts non numerics to 0
    return false if command_arr.length != 4
    return false if !directions.include?(command_arr[3])
    return false if !coords.include?(command_arr[1])
    return false if !coords.include?(command_arr[2])
    return true
end


def run_program(commands)
    if check_first_command(commands[0].chomp)
        place_robot = commands[0].split(' ').join(',').split(',')
        robot = Robot.new(place_robot[1].to_i, place_robot[2].to_i, place_robot[3])
        commands.each do |command|
            # this will ignore other commands
            if command.chomp == "MOVE"
                robot.move
            end
            if command.chomp == "RIGHT"
                robot.rotate_right
            end
            if command.chomp == "LEFT"
                robot.rotate_left
            end
            if command.chomp == "REPORT"
                robot.report
            end
        end
    else 
        puts "Invalid place command"
    end  
end



if ARGV.length != 1
    puts "We need exactly one argument"
    exit
end

commands = File.readlines(ARGV[0])


run_program(commands)


# File.open(ARGV[0], "r") do |file|

# end
# pass the file as a command line argument
# read file line by line - push each line into array
# run program looping through array

# robot.move
# robot.move
# robot.move
# robot.report