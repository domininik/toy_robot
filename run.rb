#!/usr/bin/ruby

require './toy_robot'

puts 'Hello,'
puts 'please type the command to play with the robot :)'
puts
puts 'Allowed commands are:'
puts 'PLACE followed by x value, y value and direction (e.g. PLACE 0,0,NORTH)'
puts 'REPORT, LEFT, RIGTH and MOVE'
puts
puts 'Type EXIT to exit the program.'

robot = ToyRobot.new

command = gets.chomp

until command == 'EXIT'
  case command
  when 'LEFT' then robot.left
  when 'RIGTH' then robot.right
  when 'MOVE' then robot.move
  when 'REPORT' then puts robot.report
  else
    if match = command.match(/^PLACE (?<x>\d),(?<y>\d),(?<direction>NORTH|EAST|WEST|SOUTH)$/)
      robot.place(match[:x].to_i, match[:y].to_i, match[:direction])
    else
      puts "ERROR: command #{command} is invalid"
    end
  end
  command = gets.chomp
end

puts 'BYE!'
