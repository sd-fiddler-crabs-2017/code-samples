require 'prime'

def prime_factors(number)
  return [] if number < 2

  prime_factor = lowest_prime_factor(number)
  [prime_factor] + prime_factors(number / prime_factor)
end

def prime_factor?(number,factor)
  evenly_divisible?(number, factor) && factor.prime?
end

def lowest_prime_factor(number)
  return nil if number < 2
  possible_factors(number).find{|factor| prime_factor?(number, factor) } || number
end

def possible_factors(number)
  return [] if number <= 2
  return [2] if number == 3
  (2..(number / 2)).to_a
end

def prime?(number)
  # return false if number < 2
  #
  # possible_factors_not_one_and_self(number).each do |possible_factor|
  #   return false if evenly_divisible?(number, possible_factor)
  # end
  #
  # true
  number.prime?
end
#
def evenly_divisible?(numerator, denominator)
  (numerator % denominator).zero?
end
