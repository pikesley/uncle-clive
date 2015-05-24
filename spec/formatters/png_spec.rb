require 'spec_helper'

module UncleClive
  module Formatters
    describe PNGFormatter do
      let(:fg) { FontGenerator.new }

      before :each do
        fg.formatter = UncleClive::Formatters::PNGFormatter.new
      end

      it 'returns a PNG' do
        png = fg['ODI']
        expect(png.class).to eq ChunkyPNG::Canvas

        expect(png.width).to eq 192
        expect(png.height).to eq 64
      end
    end
  end
end
