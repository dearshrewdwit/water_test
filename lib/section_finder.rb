class SectionFinder
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def process(sections, position)
    levels.each_with_index do |level, i|
      return sections if i >= levels.length - 2
      next unless level > levels[i+1]
      levels.each_with_index do |next_level, i_2|
        next unless i >= position && i_2 > i
        next unless next_level >= level || (i_2 == (levels.length - 1) && next_level > levels[i_2-1])
        sections << (i..i_2)
        return process(sections, i_2)
      end
    end
    sections
  end
end
