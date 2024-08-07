class Disk
  attr_reader :size, :color

  # Initializes a new disk with a given size and color
  def initialize(size, color)
    @size = size   # The size of the disk, affecting its width when displayed
    @color = color # The color of the disk, used for colored output
  end

  # Converts the disk to a string representation for display purposes
  def to_s
    # Generates a string of '=' characters of length (2 * size - 1) with '<' and '>' on either side
    ('=' * (@size * 2 - 1)).prepend('<').concat('>')
  end
end
