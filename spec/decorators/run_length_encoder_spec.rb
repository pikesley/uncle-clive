require 'spec_helper'

module UncleClive
  module Decorators
    describe RunLengthEncoder do
      before :each do
        @cs    = RunLengthEncoder.new FontGenerator.new
        @lines = @cs['b']
      end

      it "should have lines" do
        @lines.length.should == 8
      end

      it "should have lines containing arrays of hashes" do
        @lines[0].class.should == Array
        @lines[0][0].class.should == Hash
      end

      it "should have a first line of 0's" do
        @lines[0][0].should == {
            0 => 8
        }
      end

      it "should encode a row correctly" do
        @cs.encode([1, 1, 1, 0, 0, 0, 1]).should == [
            {
                1 => 3
            },
            {
                0 => 3
            },
            {
                1 => 1
            }
        ]
      end
      it "should have a second line thus" do
        @lines[1].should == [
            {0 => 2},
            {1 => 1},
            {0 => 5}
        ]
      end
    end
  end
end
