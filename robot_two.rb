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


robot = Robot.new(0, 0, "EAST")
commands = File.readlines('commands.txt')
chomped = []
commands.each do |command|
    chomped << command.chomp
end
p chomped


def run_program(commands)
    place_robot = commands[0].split(' ').join(',').split(',')
    robot = Robot.new(place_robot[1], place_robot[2], place_robot[3])
    commands.each do |command|
        if command == "MOVE"
            robot.move
        end
        if command == "RIGHT"
            robot.rotate_right
        end
        if command == "LEFT"
            robot.rotate_left
        end
        if command == "REPORT"
            robot.report
        end
    end

end
# File.open(ARGV[0], "r") do |file|

# end
# pass the file as a command line argument
# read file line by line - push each line into array
# run program looping through array

robot.move
robot.move
robot.move
robot.report