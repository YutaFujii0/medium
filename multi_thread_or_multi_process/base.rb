require 'benchmark'
require 'faker'
require_relative 'search'

seeds = 1.times.map { Faker::Food.dish }

puts Benchmark.measure {
  seeds.each do |seed|
    SearchImagesAndPopularity.call(seed)
  end
}


# 2.100000   0.170000   2.270000 ( 51.480358)
