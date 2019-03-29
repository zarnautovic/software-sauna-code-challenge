require 'spec_helper'
require './services/move_to_next_position'
require './constants'

describe 'MoveToNextPosition' do
    let(:current_position) { [0,3] }
    let(:direction) { 'right' }
    let(:empty_current_position) { nil }
    let(:invalid_direction) { 'lijevo' }
    let(:empty_direciton) { nil }
    describe '.call' do
        it 'return next right position [0,4]' do
            next_position = MoveToNextPosition.new(current_position, direction).call
            expect(next_position).to eq([0,4])
        end
        it 'raise current_position is empty' do
            expect { MoveToNextPosition.new(empty_current_position, direction).call }.to raise_error(Constants::ERRORS[:current_empty])
        end
        it 'raise invalid direction' do
            expect { MoveToNextPosition.new(current_position, invalid_direction).call }.to raise_error(Constants::ERRORS[:invalid_direction])
        end
        it 'raise invalid direction' do
            expect { MoveToNextPosition.new(current_position, empty_direciton).call }.to raise_error(Constants::ERRORS[:invalid_direction])
        end
    end
end