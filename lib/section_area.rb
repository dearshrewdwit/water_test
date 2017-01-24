class SectionArea
  attr_reader :section

  def initialize(section)
    @section = section
  end

  def process
    max = section.sort[-2]
    section[1..-2].map { |col| max - col }.reduce(:+)
  end
end
