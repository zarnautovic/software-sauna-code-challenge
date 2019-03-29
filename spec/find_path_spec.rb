require 'spec_helper'
require './services/find_path'
require './constants'

describe 'FindPath' do
    let(:input) { get_input('./maps/ASCII-MAP-3.txt') }
    let(:no_start_input) { get_input('./maps/ASCII-MAP-no-start.txt') }
    let(:no_finish_input) { get_input('./maps/ASCII-MAP-no-finish.txt') }
    describe '.call' do
        it 'returns path' do
            path  = FindPath.new(input).call
            expect(path).to eq('@---+B||E--+|E|+--F--+|C|||A--|-----K|||+--E--Ex')
        end
        it 'raise no start position' do
            expect { FindPath.new(no_start_input).call }.to raise_error(Constants::ERRORS[:no_start])
        end
        it 'raise no end position' do
           expect { FindPath.new(no_finish_input).call }.to raise_error(Constants::ERRORS[:no_finish])
        end
    end
end