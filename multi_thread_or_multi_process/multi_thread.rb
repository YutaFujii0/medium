require 'concurrent-ruby'
require 'benchmark'
require 'faker'
require_relative 'search'

seeds = 1.times.map { Faker::Food.dish }

puts Benchmark.measure {
  pool = Concurrent::FixedThreadPool.new(10)
  seeds.each do |seed|
    pool.post do
      SearchImagesAndPopularity.call(seed)
    end
  end
  pool.shutdown
  pool.wait_for_termination
}

# 1.640000   0.140000   1.780000 (  4.273130)
