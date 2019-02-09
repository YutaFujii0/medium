require 'benchmark'
require 'faker'
require_relative 'search'

seeds = 1.times.map { Faker::Food.dish }

puts Benchmark.measure {
  seeds.each do |seed|
    fork do
      SearchImagesAndPopularity.call(seed)
    end
  end
  Process.waitall
}


# 0.010000   0.050000  10.330000 (  2.972397)
