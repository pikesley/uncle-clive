require 'spec_helper'

module UncleClive
  module Formatters
    describe TextFormatter do
      let(:fg) { FontGenerator.new }

      before :each do
        fg.formatter = UncleClive::Formatters::TextFormatter.new
      end

      it 'should give us a correct character' do
        expect(fg['a']).to eq (
"""
00000000
00000000
00111000
00000100
00111100
01000100
00111100
00000000
"""
).strip
      end

      it 'should give us a correct string' do
        expect(fg['ab']).to eq (
"""
0000000000000000
0000000000100000
0011100000100000
0000010000111100
0011110000100010
0100010000100010
0011110000111100
0000000000000000
"""
).strip
      end

      it 'should be able to handle keys like ©' do
        expect(fg['©']).to eq (
"""
00111100
01000010
10011001
10100001
10100001
10011001
01000010
00111100
"""
).strip
      end

      it 'should recognise ' ' as a key' do
        expect(fg[' ']).to eq (
"""
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
"""
).strip
      end

      it 'should return characters other than zeroes and ones' do
        fg.formatter = UncleClive::Formatters::TextFormatter.new({ :on => 'X', :off => '.' })
        expect(fg['Sam']).to eq (
"""
........................
..XXXX..................
.X........XXX....XX.X...
..XXXX.......X...X.X.X..
......X...XXXX...X.X.X..
.X....X..X...X...X.X.X..
..XXXX....XXXX...X.X.X..
........................
"""
).strip
      end
    end
  end
end
