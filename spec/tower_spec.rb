require 'rspec'
require 'colorize'
require_relative '../lib/tower'
require_relative '../lib/disk'

RSpec.describe Tower do
  let(:tower) { Tower.new('A', 3) }

  it 'initializes with an empty disk array' do
    expect(tower.disks).to eq([])
  end

  it 'can add and remove disks' do
    disk = Disk.new(1, 'blue')
    tower.add_disk(disk)
    expect(tower.disks).to include(disk)
    expect(tower.remove_disk).to eq(disk)
    expect(tower.disks).to be_empty
  end

  it 'converts to string correctly' do
    disk = Disk.new(1, 'blue')
    tower.add_disk(disk)
    expected_output = [
      '     |     ',
      '     |     ',
      '    <=>    '.colorize(disk.color),
      '###########',
      '     A     '
    ]
    expect(tower.to_s).to eq(expected_output)
  end
end
