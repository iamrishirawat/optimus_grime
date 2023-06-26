class InputHandler
  attr_accessor :area_horizontal, :area_vertical, :cleaning_coordinates

  def initialize area, coordinates_arr
    @area = area&.downcase
    @coordinates_arr = coordinates_arr
    @cleaning_coordinates = []
  end

  def valid?
    area_valid? && coordinates_valid?
  end

  private

  def area_valid?
    valid = false
    if @area
      if @area.include? 'x'
        h, v = @area.split('x').map(&:to_i)

        if h && v && h > 0 && v > 0
          @area_horizontal = h
          @area_vertical = v
          valid = true
        else
          puts "Invalid office area entered: #{@area}."
        end
      else
        puts "Invalid office area entered: #{@area}."
      end
    else
      puts 'Office area coordinates are not entered.'
    end

    valid
  end

  def coordinates_valid?
    valid = false
    if @coordinates_arr && @coordinates_arr.any?
      @coordinates_arr.each do |coordinates|
        if coordinates.include? ','
          h, v = coordinates.split(',').map(&:to_i)

          if h && v && h > 0 && v > 0
            @cleaning_coordinates << [h, v]
            valid = true
          else
            puts "Invalid cleaning coordinates entered: #{coordinates}."
          end
        else
          puts "Invalid cleaning coordinates entered: #{coordinates}."
        end
      end
    else
      puts 'Coordinates to clean the office are not entered.'
    end

    valid
  end
end