require 'spec_helper'

module UncleClive
  module Formatters
    describe JSONFormatter do
      before :each do
        @cs           = FontGenerator.new
        @cs.formatter = UncleClive::Formatters::JSONFormatter.new
        @cs.height    = 7
      end

      it "should return JSON" do
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
    end
  end
end