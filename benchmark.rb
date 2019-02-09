require "benchmark"

puts Benchmark.measure {
  # some method
}

# In your terminal
# $ ruby benchmark.rb
# -> 0.030000   0.020000   1.980000 (  4.025866)

# The report string shows four numbers, which represent
# - the user CPU time (the time spent executing your code),
# - the system CPU time (the time spent in the kernel),
# - both user and system CPU time added up,
# - the actual time (or wall clock time)
# it took for the block to execute in brackets.
# https://blog.appsignal.com/2018/02/27/benchmarking-ruby-code.html


input = ("a".."z").map { |letter| [letter, letter] }.to_h
n = 50_000

Benchmark.bm do |benchmark|
  benchmark.report("Hash[]") do
    n.times do
      input.map { |key, value| [key.to_sym, value] }.to_h
    end
  end

  benchmark.report("{}.tap") do
    n.times do
      {}.tap do |new_hash|
        input.each do |key, value|
          new_hash[key.to_sym] = value
        end
      end
    end
  end
end
