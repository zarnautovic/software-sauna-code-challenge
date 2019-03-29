require 'spec_helper'
require './services/get_element'
require './constants'

describe 'GetElement' do
    let(:map) { map_array }
    let(:empty_map) { empty_map_array }
    let(:position) { [0,2] }
    let(:empty_position) { nil }
    describe '.call' do
        it 'returns start element @' do
            element = GetElement.new(position, map).call
            expect(element).to eq('@')
        end
        it 'raise map is empty error' do
            expect { GetElement.new(position, empty_map).call }.to raise_error(Constants::ERRORS[:empty_map])
        end
        it 'raise position is empty' do
            expect { GetElement.new(empty_position, map).call }.to raise_error(Constants::ERRORS[:empty_position])
        end
    end
end