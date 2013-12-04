require 'spec_helper'

module UncleClive
  module Formatters
    describe JSONFormatter do
      before :each do
        @cs           = FontGenerator.new
        @cs.formatter = UncleClive::Formatters::JSONFormatter.new
        @cs.pokrovsky   = true
      end

      it "should return JSON with 7 lines" do
        @cs[' '].should == {
            :id   => " ",
            :data => [
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0]
            ]
        }.to_json
      end

      it "should correctly choose which line to excise" do
        @cs['©'].should == {
            :id   => "©",
            :data => [
                [0, 0, 4, 4, 4, 4, 0, 0],
                [0, 4, 0, 0, 0, 0, 4, 0],
                [4, 0, 0, 4, 4, 0, 0, 4],
                [4, 0, 4, 0, 0, 0, 0, 4],
                [4, 0, 0, 4, 4, 0, 0, 4],
                [0, 4, 0, 0, 0, 0, 4, 0],
                [0, 0, 4, 4, 4, 4, 0, 0]
            ]
        }.to_json
      end
    end
  end
end