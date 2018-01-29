require 'benchmark'
require_relative './lib/water'
require_relative './lib/water_original_solution'

iterations = 100_000
towers = [5, 3, 7, 2, 6, 4, 5, 9, 1, 2]

w = Water.new

Benchmark.bm do |bm|
  bm.report do
    puts "Old solution"
    iterations.times do
      w.find_water_old(towers)
    end
  end

  bm.report do
    puts "New solution"
    iterations.times do
      w.find_water(towers)
    end
  end
end