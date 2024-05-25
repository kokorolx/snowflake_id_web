class StressCpuService
  def initialize(duration: 10)
    @duration = duration
  end

  def stress_test
    start_time = Time.now
    end_time = start_time + @duration

    loop do
      # Perform CPU-intensive calculations
      prime_numbers = generate_prime_numbers(100_000)

      # Check if stress test should continue
      break if Time.now >= end_time
    end

    puts "Stress test completed after #{@duration} seconds."
  end

  private

  def generate_prime_numbers(limit)
    prime_numbers = []
    (2..limit).each do |num|
      is_prime = true
      (2..Math.sqrt(num)).each do |divisor|
        if num % divisor == 0
          is_prime = false
          break
        end
      end
      prime_numbers << num if is_prime
    end
    prime_numbers
  end
end
