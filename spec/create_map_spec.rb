require 'spec_helper'
require './services/create_map'
require './constants'

describe 'CreateMap' do
    let(:input) { get_input('./maps/ASCII-MAP-3.txt') }
    let(:empty_input) { get_empty_input }
    describe '.call' do
        it "returns two dimensional array" do
            map = CreateMap.new(input).call
            expect(map).to be_instance_of(Array)
            expect(map[0]).to be_instance_of(Array)
        end
        it "raise empty input error" do
            expect { CreateMap.new(empty_input).call }.to raise_error(Constants::ERRORS[:empty_input])
        end
    end
end