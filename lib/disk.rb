# Represents a disk in the tower
#
# The `Disk` class is used to represent an individual disk in the game, including its size and color.
class Disk
  # The size of the disk, affecting its width when displayed
  #
  # @return [Integer] the size of the disk
  attr_reader :size

  # The color of the disk, used for colored output
  #
  # @return [String] the color of the disk
  attr_reader :color

  # Initializes a new disk with a given size and color
  #
  # @param size [Integer] the size of the disk, which affects its width
  # @param color [String] the color of the disk, used for displaying the disk
  def initialize(size, color)
    @size = size   # The size of the disk, affecting its width when displayed
    @color = color # The color of the disk, used for colored output
  end

  # Converts the disk to a string representation for display purposes
  #
  # @return [String] the string representation of the disk with '=' characters and '<' and '>'
  def to_s
    # Generates a string of '=' characters of length (2 * size - 1) with '<' and '>' on either side
    ('=' * (@size * 2 - 1)).prepend('<').concat('>')
  end
end