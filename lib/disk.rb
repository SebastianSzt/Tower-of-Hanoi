class Disk
  attr_reader :size, :color

  def initialize(size, color)
    @size = size
    @color = color
  end

  def to_s
    ('=' * (@size * 2 - 1)).prepend('<').concat('>').colorize(@color)
  end
end
