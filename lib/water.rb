class Water
  def find_water(levels)
    sections = find_sections(levels)
    water_areas = sections.map { |section| levels[section] }
    water_areas.map { |section| find_area(section) }.reduce(:+)
  end

  private

  def find_sections(levels)
    SectionFinder.new(levels).process([], 0)
  end

  def find_area(section)
    SectionArea.new(section).process
  end
end
