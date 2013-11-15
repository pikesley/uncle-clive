require 'spec_helper'

module UncleClive
  module Formatters
    describe PNGFormatter do
      before :each do
        @cs           = FontGenerator.new
        @cs.formatter = UncleClive::Formatters::PNGFormatter.new
      end

      it "should return a PNG" do
      end
    end
  end
end
