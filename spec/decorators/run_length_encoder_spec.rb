require 'spec_helper'

module UncleClive
  module Decorators
    describe RunLengthEncoder do
      let(:fg) { RunLengthEncoder.new FontGenerator.new }
      let(:lines) { fg['b'] }

      it 'has lines' do
        expect(lines.length).to eq 8
      end

      it 'has lines containing arrays of hashes' do
        expect(lines[0].class).to eq Array
        expect(lines[0][0].class).to eq Hash
      end

      it 'has a first line of zeroes' do
        expect(lines[0][0]).to eq ({ 0 => 8 })
      end

      it 'encodes a row correctly' do
        expect(fg.encode [1, 1, 1, 0, 0, 0, 1]).to eq [
          { 1 => 3 },
          { 0 => 3 },
          { 1 => 1 }
        ]
      end

      it 'has a second line thus' do
        expect(lines[1]).to eq [
          { 0 => 2 },
          { 1 => 1 },
          { 0 => 5 }
        ]
      end
    end
  end
end
