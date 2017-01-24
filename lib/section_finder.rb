class SectionFinder
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def process(sections, start, stop)
    return sections if start >= levels.length - 2
    return process(sections, start+1, stop) unless levels[start] > levels[start+1]
    return process(sections, start, stop+1) unless stop > start && (levels[stop] >= levels[start] || stop == (levels.length - 1))
    return process(sections, start+1, start+1) unless levels[stop] >= levels[start] || (stop == (levels.length - 1) && levels[stop] > levels[stop-1])
    sections << (start..stop)
    process(sections, stop, stop)
  end
end
