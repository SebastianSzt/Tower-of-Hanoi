require 'colorize'
require_relative './lib/disk'
require_relative './lib/tower'
require_relative './lib/solver'

# Function to get a valid number of disks from the user
def get_number_of_disks
  loop do
    print 'Enter the number of disks (from 1 to 9): '
    input = gets.chomp
    # Check if input is a digit and within the allowed range
    return input.to_i if input.match?(/^\d+$/) && (1..9).include?(input.to_i)

    # Prompt user to try again in case of invalid input
    puts 'Invalid input. Please try again.'
  end
end

# Prompt the user for the number of disks and initialize the Solver
num_disks = get_number_of_disks
hanoi = Solver.new(num_disks)

# Solve the Towers of Hanoi problem
hanoi.solve
