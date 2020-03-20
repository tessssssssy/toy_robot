
class Robot
    @@board = [
        ["*", "*", "*", "*", "*"],
        ["*", "*", "*", "*", "*"],
        ["*", "*", "*", "*", "*"],
        ["*", "*", "*", "*", "*"],
        ["*", "*", "*", "*", "*"]]
    attr_accessor :row, :col, :face
    def initialize(row, col, face)
        @row = row
        @col = col
        @face = face
    end

    def display_board
        pp @@board
    end

    def place_robot #two digit array
        if @@board[@row][@col] != nil
            @@board[@row][@col] = @face
        end      
    end

    def move(direction)
        @@board[@row][@col] = "*"
        if direction == "N"
            @row = @row - 1
        elsif direction == "E"
            @col = @col + 1
        elsif direction == "S"
            @row = @row + 1
        else
            @col = @col - 1
        end
        place_robot
    end

    def check_move
        if @face == "E"
            if @col != 4
                move(@face)
            else
                puts "Cant move"
            end
        elsif @face == "S"
            if @row != 4
                move(@face)
            else
                puts "Cant move"
            end
        elsif @face == "W"
            if @col != 0
                move(@face)
            else 
                puts "Cant Move"
            end
        else 
            if @row != 0
                move(@face)
            else
                puts "Cant Move"
            end
        end  
    end

    def rotate_right
        if @face == "N"
            @face = "E"
        elsif @face == "E"
            @face = "S"
        elsif @face == "S"
            @face = "W"
        else 
            @face = "N"
        end
        place_robot
    end

    def rotate_left
        if @face == "N"
            @face = "W"
        elsif @face == "W"
            @face = "S"
        elsif @face == "S"
            @face = "W"
        else
            @face = "N"
        end
        place_robot
    end
end





# class ToyRobot
#     attr_reader :coords
#     def initialize
#         @coords = [
#                    ["*", "*", "*", "*", "*"],
#                    ["*", "*", "*", "*", "*"],
#                    ["*", "*", "*", "*", "*"],
#                    ["*", "*", "*", "*", "*"],
#                    ["*", "*", "*", "*", "*"]]
#     end

#     def display_board
#         pp @coords
#     end
#     #place robot - when you first start the game
#     def place_robot(robot) #two digit array
#         if @coords[robot.row][robot.col] != nil
#             @coords[robot.row][robot.col] = robot.face
#         end      
#     end

#     def move

#     end
# end

robot = Robot.new(0,0,"E")

robot.place_robot
robot.display_board

robot.check_move
robot.check_move
robot.check_move
robot.display_board

# robot.rotate_left
# robot.display_board

# robot.check_move
# robot.display_board
