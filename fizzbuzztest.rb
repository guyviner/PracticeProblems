# require 'benchmark'
# 1. Write a function that prints out all integers between 0 and n that fit one of these three criteria:
#
# a) i is divisible by 3
# b) i is divisible by 5
# c) i is divisible by 3 and 5
#
# For example, if (n) is 15 the output would be:
#
# 3 is divisible by 3
# 5 is divisible by 5
# 6 is divisible by 3
# 9 is divisible by 3
# 10 is divisible by 5
# 12 is divisible by 3
# 15 is divisible by 3 and 5
def divisibles(n)
  mult3 = 3
  mult5 = 5
  while mult3 <= n || mult5 <= n
    if mult3 == mult5
      puts "#{mult3} is divisible by 3 and 5"
      mult3 += 3
      mult5 += 5
    elsif mult3 < mult5
      puts "#{mult3} is divisible by 3"
      mult3 += 3
    else
      puts "#{mult5} is divisible by 5"
      mult5 += 5
    end
  end
end

divisibles(100)

# puts Benchmark.measure { divisibles(100000) }
