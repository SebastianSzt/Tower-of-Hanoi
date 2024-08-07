require 'rspec'
require_relative '../lib/disk'

RSpec.describe Disk do
  it 'initializes with size and color' do
    disk = Disk.new(3, 'red')
    expect(disk.size).to eq(3)
    expect(disk.color).to eq('red')
  end

  it 'converts to string correctly' do
    disk = Disk.new(3, 'red')
    expect(disk.to_s).to eq('<=====>')
  end
end
