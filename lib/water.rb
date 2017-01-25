class Water
  def find_water(data)
    max_l = []
    max_r = []
    water = 0

    for i in 0..levels.length-1 do
      max_l[i] = [levels[i], (i != 0) ? max_l[i - 1] : 0].max
    end

    i = levels.length-1
    while i >= 0 do
      max_r[i] = [levels[i], i < (levels.length - 1) ? max_r[i + 1] : 0].max
      i -= 1
    end

    for i in 1..levels.length-1 do
      water += [max_l[i], max_r[i]].min - levels[i];
    end

    water
  end
end
