require_relative './lib/input_handler'
require_relative './lib/optimus_grime'

commands = ARGV

inputs = InputHandler.new(commands[0], commands[1..])
if inputs.valid?
  robot = OptimusGrime.new(inputs.area_horizontal, inputs.area_vertical)

  inputs.cleaning_coordinates.each do |horizontal, vertical|
    robot.move(horizontal, vertical)
  end
else
  puts "Please check the inputs: #{commands}"
end

puts ''
