require 'test/unit'
require './toy_robot'

class TestToyRobot < Test::Unit::TestCase
  def test_place
    robot = ToyRobot.new
    robot.place(0, 1, ToyRobot::EAST)
    assert_equal(0, robot.position[0])
    assert_equal(1, robot.position[1])
    assert_equal(ToyRobot::EAST, robot.direction)
  end

  def test_invalid_place_behind_the_east_border
    robot = ToyRobot.new
    robot.place(5, 2, ToyRobot::EAST)
    assert_equal(nil, robot.position)
    assert_equal(nil, robot.direction)
  end

  def test_invalid_place_behind_the_south_border
    robot = ToyRobot.new
    robot.place(2, -1, ToyRobot::EAST)
    assert_equal(nil, robot.position)
    assert_equal(nil, robot.direction)
  end

  def test_invalid_place_behind_the_west_border
    robot = ToyRobot.new
    robot.place(-1, 0, ToyRobot::EAST)
    assert_equal(nil, robot.position)
    assert_equal(nil, robot.direction)
  end

  def test_invalid_place_behind_the_north_border
    robot = ToyRobot.new
    robot.place(2, 5, ToyRobot::EAST)
    assert_equal(nil, robot.position)
    assert_equal(nil, robot.direction)
  end

  def test_report_without_position
    robot = ToyRobot.new
    assert_equal(false, robot.report)
  end

  def test_report
    robot = ToyRobot.new
    robot.place(1, 2, ToyRobot::NORTH)
    assert_equal('1,2,NORTH', robot.report)
  end

  def test_left_without_direction
    robot = ToyRobot.new
    robot.left
    assert_equal(nil, robot.direction)
  end

  def test_left
    robot = ToyRobot.new
    robot.place(0, 0, ToyRobot::NORTH)
    robot.left
    assert_equal(ToyRobot::WEST, robot.direction)
    robot.left
    assert_equal(ToyRobot::SOUTH, robot.direction)
    robot.left
    assert_equal(ToyRobot::EAST, robot.direction)
    robot.left
    assert_equal(ToyRobot::NORTH, robot.direction)
  end

  def test_right_without_direction
    robot = ToyRobot.new
    robot.right
    assert_equal(nil, robot.direction)
  end

  def test_right
    robot = ToyRobot.new
    robot.place(0, 0, ToyRobot::NORTH)
    robot.right
    assert_equal(ToyRobot::EAST, robot.direction)
    robot.right
    assert_equal(ToyRobot::SOUTH, robot.direction)
    robot.right
    assert_equal(ToyRobot::WEST, robot.direction)
    robot.right
    assert_equal(ToyRobot::NORTH, robot.direction)
  end

  def test_move_without_position
    robot = ToyRobot.new
    robot.move
    assert_equal(nil, robot.position)
  end

  def test_invalid_move_in_south_west_corner
    robot = ToyRobot.new
    robot.place(0, 0, ToyRobot::WEST)
    robot.move
    assert_equal([0, 0], robot.position)
    robot.place(0, 0, ToyRobot::SOUTH)
    robot.move
    assert_equal([0, 0], robot.position)
  end

  def test_invalid_move_in_south_east_corner
    robot = ToyRobot.new
    robot.place(4, 0, ToyRobot::EAST)
    robot.move
    assert_equal([4, 0], robot.position)
    robot.place(4, 0, ToyRobot::SOUTH)
    robot.move
    assert_equal([4, 0], robot.position)
  end

  def test_invalid_move_in_north_east_corner
    robot = ToyRobot.new

    robot.place(4, 4, ToyRobot::NORTH)
    robot.move
    assert_equal([4, 4], robot.position)

    robot.place(4, 4, ToyRobot::EAST)
    robot.move
    assert_equal([4, 4], robot.position)
  end

  def test_invalid_move_in_north_west_corner
    robot = ToyRobot.new
    robot.place(0, 4, ToyRobot::NORTH)
    robot.move
    assert_equal([0, 4], robot.position)
    robot.place(0, 4, ToyRobot::WEST)
    robot.move
    assert_equal([0, 4], robot.position)
  end

  def test_invalid_move_in_north_border
    robot = ToyRobot.new
    robot.place(2, 4, ToyRobot::NORTH)
    robot.move
    assert_equal([2, 4], robot.position)
  end

  def test_invalid_move_in_east_border
    robot = ToyRobot.new
    robot.place(4, 2, ToyRobot::EAST)
    robot.move
    assert_equal([4, 2], robot.position)
  end

  def test_invalid_move_in_south_border
    robot = ToyRobot.new
    robot.place(3, 0, ToyRobot::SOUTH)
    robot.move
    assert_equal([3, 0], robot.position)
  end

  def test_invalid_move_in_west_border
    robot = ToyRobot.new
    robot.place(0, 2, ToyRobot::WEST)
    robot.move
    assert_equal([0, 2], robot.position)
  end

  def test_valid_move_in_north_direction
    robot = ToyRobot.new
    robot.place(0, 0, ToyRobot::NORTH)
    robot.move
    assert_equal([0, 1], robot.position)
  end

  def test_valid_move_in_east_direction
    robot = ToyRobot.new
    robot.place(2, 2, ToyRobot::EAST)
    robot.move
    assert_equal([3, 2], robot.position)
  end

  def test_valid_move_in_south_direction
    robot = ToyRobot.new
    robot.place(3, 3, ToyRobot::SOUTH)
    robot.move
    assert_equal([3, 2], robot.position)
  end

  def test_valid_move_in_west_direction
    robot = ToyRobot.new
    robot.place(1, 1, ToyRobot::WEST)
    robot.move
    assert_equal([0, 1], robot.position)
  end
end
