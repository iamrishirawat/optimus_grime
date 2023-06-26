class OptimusGrime
  def initialize(horizontal_max, vertical_max)
    @horizontal_max = horizontal_max
    @vertical_max = vertical_max
    @horizontal_position = 0
    @vertical_position = 0
  end

  def move horizontal, vertical
    unless coordinates_invalid?(horizontal, vertical)
      if @horizontal_position != horizontal
        move_horizontal horizontal
      end

      if @vertical_position != vertical
        move_vertical vertical
      end

      print 'C'
    else
      puts "Coordinates (#{horizontal}, #{vertical}) are falling outside the defined area."
    end
  end

  # To make sure the coordinates don't fall out of the area limit
  # Conditions checked in the following order:
  # 1. Doesn't fall outside the East side of the area limit
  # 2. Doesn't fall outside the North side of the area limit
  # 3. Doesn't fall outside the West side of the area limit
  # 4. Doesn't fall outside the South side of the area limit
  def coordinates_invalid? horizontal, vertical
    (horizontal > @horizontal_max) || (vertical > @vertical_max) ||
      (horizontal < 0) || (vertical < 0)
  end

  def move_horizontal horizontal
    if horizontal < @horizontal_position
      # Move West
      (@horizontal_position - horizontal).times do |move|
        print 'W'
      end
    elsif horizontal > @horizontal_position
      # Move East
      (horizontal - @horizontal_position).times do |move|
        print 'E'
      end
    end

    @horizontal_position = horizontal
  end

  def move_vertical vertical
    if vertical < @vertical_position
      # Move South
      (@vertical_position - vertical).times do |move|
        print 'S'
      end
    elsif vertical > @vertical_position
      # Move North
      (vertical - @vertical_position).times do |move|
        print 'N'
      end
    end

    @vertical_position = vertical
  end
end
