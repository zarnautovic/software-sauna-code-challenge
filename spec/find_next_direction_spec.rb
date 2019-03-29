require 'spec_helper'
require './services/find_next_direction'
require './constants'

describe 'Find Direction' do
    let(:map) { map_array }
    let(:current_position) { [0,2] }
    let(:empty_map) { empty_map_array }
    let(:empty_current_position) { nil }
    describe '.call' do
        it 'returns next direction' do
            direction = FindNextDirection.new(map, current_position).call
            expect(direction).to eq 'right'
        end
        it 'raise map is empty' do
            expect { FindNextDirection.new(empty_map, current_position).call }.to raise_error(Constants::ERRORS[:empty_map])
        end
        it 'raise current position is empty' do
            expect { FindNextDirection.new(map, empty_current_position).call }.to raise_error(Constants::ERRORS[:current_empty])
        end
    end
end