require 'colorize'
require_relative './lib/disk'
require_relative './lib/tower'
require_relative './lib/solver'

def get_number_of_disks
  loop do
    print 'Enter the number of disks (from 1 to 9): '
    input = gets.chomp
    return input.to_i if input.match?(/^\d+$/) && (1..9).include?(input.to_i)

    puts 'Invalid input. Please try again.'
  end
end

num_disks = get_number_of_disks
hanoi = Solver.new(num_disks)
hanoi.solve
