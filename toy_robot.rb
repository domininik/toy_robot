class ToyRobot
  X_MIN = 0
  Y_MIN = 0
  X_MAX = 4
  Y_MAX = 4
  NORTH = 'NORTH'
  EAST = 'EAST'
  WEST = 'WEST'
  SOUTH = 'SOUTH'

  attr_reader :position, :direction

  def place(x, y, direction)
    return false if x < X_MIN || x > X_MAX || y < Y_MIN || y > Y_MAX

    @position = [x, y]
    @direction = direction
  end

  def report
    return false unless position

    "#{position[0]},#{position[1]},#{direction}"
  end

  def left
    @direction = case direction
    when NORTH then WEST
    when EAST then NORTH
    when WEST then SOUTH
    when SOUTH then EAST
    end
  end

  def right
    @direction = case direction
    when NORTH then EAST
    when EAST then SOUTH
    when WEST then NORTH
    when SOUTH then WEST
    end
  end

  def move
    case direction
    when NORTH
      @position[1] += 1 unless position[1] + 1 > Y_MAX
    when EAST
      @position[0] += 1 unless position[0] + 1 > X_MAX
    when WEST
      @position[0] -= 1 unless position[0] - 1 < X_MIN
    when SOUTH
      @position[1] -= 1 unless position[1] -1 < Y_MIN
    end
  end
end
