class Water
  
  def find_water(towers)
    raise TypeError unless towers.kind_of?(Array)

    max_left = highest_towers_left(towers)
    max_right = highest_towers_right(towers)

    water_collected = 0
    towers.each_with_index do |height, index| 
      barrier = [max_left[index],max_right[index]].min
      water_collected += (barrier - height) if barrier > height
    end
    water_collected

  end

  def highest_towers_left(towers)
    current_max = 0
    max_left = []
    towers.each { |height|
      max_left << current_max
      current_max = height if height > current_max
    }
    max_left
  end

  def highest_towers_right(towers)
    current_max = 0
    max_right = []
    towers.reverse_each { |height|
      max_right << current_max
      current_max = height if height > current_max
    }
    max_right.reverse!
  end

end