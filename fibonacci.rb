require 'prime'

class Fibber
  attr_reader :fib_generator, :prime_checker
 
  def initialize
    @fib_generator = FibGenerator.new
    @prime_checker = PrimeChecker.new
  end

  def get_instruction
    puts "Enter (n)ext or (q)uit:"
    input = gets.strip
  end

  def find_next_number
    result = fib_generator.next

    if prime_checker.is_prime?(result)
      "#{result} (prime)"
    else
      result
    end
  end

  def print_next_number
    puts find_next_number
  end

  def print_intro
    puts "Come getcha some Fibonwhatever numbers!"
  end

  def print_outro
    print "Seeya!"
  end

  def run
    print_intro
    input = ""

    while input != "q"
      input = get_instruction
      if input == "n"
        print_next_number
      end
    end

    print_outro
  end
end

class PrimeChecker
  def is_prime?(input)
    Prime.prime?(input)
  end
end

class FibGenerator

  def initialize
    @past_two = 0
    @past_one = 1
  end

  def next
    @result = @past_two + @past_one
    @past_two = @past_one
    @past_one = @result

    return @result
  end

end

Fibber.new.run
