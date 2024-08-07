# Solves the Towers of Hanoi puzzle
#
# The `Solver` class manages the state of the Towers of Hanoi puzzle and solves it by moving disks between towers.
class Solver
  # Initializes a new solver with the given number of disks
  #
  # @param num_disks [Integer] the number of disks to be used in the puzzle
  def initialize(num_disks)
    @num_disks = num_disks
    # Initialize three towers for the game
    @towers = [
      Tower.new('A', num_disks), # Source tower
      Tower.new('B', num_disks), # Auxiliary tower
      Tower.new('C', num_disks)  # Target tower
    ]
    # Define a list of colors to use for the disks
    colors = %i[red green yellow blue magenta cyan light_red light_green light_yellow]

    # Populate the source tower with disks in descending order of size
    @num_disks.downto(1) do |size|
      # Assign a color to each disk, cycling through the colors array
      @towers[0].add_disk(Disk.new(size, colors[(size - 1) % colors.length]))
    end
  end

  # Starts the process of solving the Towers of Hanoi puzzle
  #
  # This method prints the initial state of the towers and then recursively solves the puzzle
  def solve
    # Print the initial state of the towers
    print_towers
    # Solve the Towers of Hanoi by moving all disks from the source to the target tower
    move_disks(@num_disks, @towers[0], @towers[1], @towers[2])
  end

  private

  # Recursively moves disks between towers
  #
  # @param num_disks [Integer] the number of disks to move
  # @param source_tower [Tower] the tower from which disks are moved
  # @param auxiliary_tower [Tower] the tower used as an intermediate step
  # @param target_tower [Tower] the tower to which disks are moved
  def move_disks(num_disks, source_tower, auxiliary_tower, target_tower)
    return unless num_disks.positive?

    # Recursive call: move n-1 disks from source to auxiliary tower
    move_disks(num_disks - 1, source_tower, target_tower, auxiliary_tower)

    # Move the nth disk from source to target tower
    move_single_disk(source_tower, target_tower)

    # Recursive call: move the n-1 disks from auxiliary to target tower
    move_disks(num_disks - 1, auxiliary_tower, source_tower, target_tower)
  end

  # Moves a single disk from the source tower to the target tower
  #
  # @param source_tower [Tower] the tower from which the disk is removed
  # @param target_tower [Tower] the tower to which the disk is added
  def move_single_disk(source_tower, target_tower)
    disk = source_tower.remove_disk
    target_tower.add_disk(disk)
    print_towers
  end

  # Prints the current state of all towers to the console
  #
  # This method clears the screen and displays each level of the towers side by side.
  def print_towers
    system('clear') || system('cls')

    # Get the string representation of each tower
    tower_strings = @towers.map { |tower| tower.to_s }

    # Loop through each level of the towers and print them side by side
    (0...tower_strings[0].size).each do |i|
      # Print the ith level of each tower with spaces in between
      puts tower_strings.map { |tower| tower[i] }.join('   ')
    end

    sleep(1)
  end
end