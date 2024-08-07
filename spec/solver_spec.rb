require 'rspec'
require_relative '../lib/solver'
require_relative '../lib/tower'
require_relative '../lib/disk'

RSpec.describe Solver do
  let(:num_disks) { 3 }
  let(:solver) { Solver.new(num_disks) }

  it 'initializes with the correct number of disks on the source tower' do
    expect(solver.instance_variable_get(:@towers)[0].disks.size).to eq(num_disks)
  end

  it 'initializes with three towers' do
    expect(solver.instance_variable_get(:@towers).size).to eq(3)
    expect(solver.instance_variable_get(:@towers).map(&:name)).to eq(['A', 'B', 'C'])
  end
end
