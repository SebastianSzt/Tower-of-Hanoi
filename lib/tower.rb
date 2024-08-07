# Represents a single tower in the game
#
# The `Tower` class is used to manage the disks on a tower, allowing adding and removing disks as well as displaying the state of the tower.
class Tower
  # Array holding the disks currently on the tower
  #
  # @return [Array] the array of disks on the tower
  attr_accessor :disks

  # Total number of disks in the puzzle
  #
  # @return [Integer] the total number of disks in the puzzle
  attr_accessor :num_disks

  # The name of the tower
  #
  # @return [String] the name of the tower (e.g., "A", "B", "C")
  attr_reader :name

  # Initializes a new tower with a name and the total number of disks
  #
  # @param name [String] the name of the tower
  # @param num_disks [Integer] the total number of disks in the puzzle
  def initialize(name, num_disks)
    @disks = [] # An array to hold the disks currently on this tower
    @num_disks = num_disks # The total number of disks in the puzzle
    @name = name # The name of the tower (e.g., "A", "B", "C")
  end

  # Adds a disk to the top of the tower
  #
  # @param disk [Disk] the disk to be added
  def add_disk(disk)
    @disks.push(disk) # Pushes the disk onto the stack (end of the array)
  end

  # Removes and returns the top disk from the tower
  #
  # @return [Disk, nil] the removed disk or `nil` if the tower was empty
  def remove_disk
    @disks.pop # Removes the last disk from the array
  end

  # Converts the tower and its disks to a string representation for display
  #
  # @return [String] the string representation of the tower
  def to_s
    # Calculate the maximum disk width based on the largest disk size
    max_disk_width = @num_disks * 2 - 1 + 2
    # Calculate the total width of the floor and the tower's display area
    floor_width = max_disk_width + 4

    # Initialize the tower representation with placeholders for empty spots
    tower_representation = Array.new(@num_disks - @disks.size, '|'.center(floor_width))

    # Add string representations of the disks, reversed to display the top disk first
    tower_representation += @disks.reverse.map do |disk|
      # Center each disk representation and apply its color
      disk.to_s.center(floor_width).colorize(disk.color)
    end

    # Add the base of the tower
    tower_representation.push(('#' * floor_width).center(floor_width))
    # Add the name of the tower below the base
    tower_representation.push(@name.center(floor_width))
  end
end