require 'spec_helper'
require './services/find_position'

describe 'Find Position' do
    let(:map)  { map_array }
    let(:start) {'@'}
    let(:finish) {'x'}
    let(:error_element) {'%'}
    describe '.call' do
        it 'returns position of start' do
            position = FindPosition.new(map, start).call
            expect(position[0]).to eq(0)
            expect(position[1]).to eq(2)
        end
        it 'returns position of finish' do
            position = FindPosition.new(map, finish).call
            expect(position[0]).to eq(6)
            expect(position[1]).to eq(7)
        end
        it 'returns nil' do
            position = FindPosition.new(map, error_element).call
            expect(position).to eq(nil)
        end
    end
end