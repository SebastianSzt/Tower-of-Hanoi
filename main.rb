require 'colorize'
require_relative './lib/disk'
require_relative './lib/tower'
require_relative './lib/solver'

# Function to get a valid number of disks from the user
#
# This method prompts the user to enter a number of disks within the range of 1 to 9.
# It ensures the input is a valid integer and falls within the specified range.
# If the input is invalid, it will repeatedly prompt the user until a valid number is entered.
#
# @return [Integer] the number of disks entered by the user
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
#
# This code calls `get_number_of_disks` to get a valid number of disks from the user
# and then creates a new `Solver` instance with that number. It then starts solving
# the Towers of Hanoi problem using the `solve` method of the `Solver` class.
#
# @example
#   num_disks = get_number_of_disks
#   hanoi = Solver.new(num_disks)
#   hanoi.solve
num_disks = get_number_of_disks
hanoi = Solver.new(num_disks)

# Solve the Towers of Hanoi problem
#
# This line initiates the process of solving the Towers of Hanoi puzzle using the `solve` method
# of the `Solver` class, which will handle the entire process of moving disks between towers.
hanoi.solve