require 'spec_helper'

module UncleClive
  module Formatters
    describe HTMLTableFormatter do
      let(:fg) { FontGenerator.new }

      before :each do
        fg.formatter = UncleClive::Formatters::HTMLTableFormatter.new
      end

      it 'should look table-ish' do
        fg.formatter.rle = false
        expect(fg['a']).to match /<table/
      end

      it 'should have rows 8 cells wide' do
        fg.formatter.rle = false
        expect(fg['a']).to match /<tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr>/
      end

      it 'should be a complete table' do
        fg.formatter.rle = false
        expect(fg['1982']).to match /<!-- 1982 -->/
        expect(fg['1982']).to match /<table class="sinclair"><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="on"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr><\/table>/
      end

      it 'should be run-length encoded by default' do
        expect(fg['b']).to match /<tr class="sinclair"><td class="off" colspan="8"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="2"> <\/td><td class="on"> <\/td><td class="off" colspan="5"> <\/td><\/tr>/
      end

      it 'should have a row of single cells to make the spacing sane' do
        expect(fg['b']).to match /<tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr><\/table>/
      end
    end
  end
end
