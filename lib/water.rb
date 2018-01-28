class Water
  def find_water(towers)
    raise TypeError unless towers.kind_of?(Array)
    water_collected = 0
    towers.each_with_index { |tower_height,index| 
      barrier_height = max_fill_level(towers,index)
      water_collected += (barrier_height - tower_height) if barrier_height > tower_height
    }
    water_collected
  end

  def max_fill_level(towers,index)
    left = highest_tower_to_left(towers,index)
    right = highest_tower_to_right(towers,index)
    [left,right].min
  end

  def highest_tower_to_right(towers,index)
    towers.slice(index+1,towers.length).max.to_i
  end

  def highest_tower_to_left(towers,index)
    towers.slice(0,index).max.to_i
  end
end