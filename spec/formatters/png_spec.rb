require 'spec_helper'

module UncleClive
  module Formatters
    describe PNGFormatter do
      before :each do
        @cs           = FontGenerator.new
        @cs.formatter = UncleClive::Formatters::PNGFormatter.new
      end

      it "should return a PNG" do
        png = @cs['ODI']
        png.class.should == ChunkyPNG::Canvas
#        png.width.should == 192
      end
    end
  end
end
