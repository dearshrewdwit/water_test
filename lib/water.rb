class Water
  def find_water(levels)
    sections = find_sections(levels, [], 0)
    water_areas = sections.map { |section| levels[section] }
    water_areas.map { |section| area(section)}.reduce(:+)
  end

  def area(section)
    max = section.sort[-2]
    section[1..-2].map { |col| max - col }.reduce(:+)
  end

  def find_sections(levels, sections, position)
    levels.each_with_index do |level, i|
      return sections if i >= levels.length - 2
      next unless level > levels[i+1]
      levels.each_with_index do |next_level, i_2|
        next unless i >= position && i_2 > i
        next unless next_level >= level || (i_2 == (levels.length - 1) && next_level > levels[i_2-1])
        sections << (i..i_2)
        return find_sections(levels, sections, i_2)
      end
    end
    sections
  end

end
