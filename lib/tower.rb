class Tower
  attr_accessor :disks, :num_disks
  attr_reader :name

  def initialize(name, num_disks)
    @disks = []
    @num_disks = num_disks
    @name = name
  end

  def add_disk(disk)
    @disks.push(disk)
  end

  def remove_disk
    @disks.pop
  end

  def to_s
    max_disk_width = @num_disks * 2 - 1 + 2
    floor_width = max_disk_width + 4
    tower_representation = Array.new(@num_disks - @disks.size, '|'.center(floor_width))
    tower_representation += @disks.reverse.map { |disk| disk.to_s.center(floor_width).colorize(disk.color) }
    tower_representation.push(('#' * floor_width).center(floor_width))
    tower_representation.push(@name.center(floor_width))
  end
end
