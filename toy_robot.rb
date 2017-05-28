class ToyRobot
  Position = Struct.new(:x, :y)

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
    return false unless position_valid?(x, y)

    @position = Position.new(x, y)
    @direction = direction
  end

  def report
    return false unless position

    "#{position.x},#{position.y},#{direction}"
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
    return false unless position

    case direction
    when NORTH
      position.y += 1 if position_valid?(position.x, position.y + 1)
    when EAST
      position.x += 1 if position_valid?(position.x + 1, position.y)
    when WEST
      position.x -= 1 if position_valid?(position.x - 1, position.y)
    when SOUTH
      position.y -= 1 if position_valid?(position.x, position.y - 1)
    end
  end

  private

  def position_valid?(x, y)
    (X_MIN..X_MAX).include?(x) && (Y_MIN..Y_MAX).include?(y)
  end
end
