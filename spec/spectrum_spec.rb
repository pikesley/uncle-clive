require 'spec_helper'

module UncleClive
  describe FontGenerator do
    before :each do
      @cs = FontGenerator.new
    end

    it "should have the correct keys and values" do
      @cs.fetch("a").should == [0, 0, 56, 4, 60, 68, 60, 0]
    end

    it "should give us an array of bits" do
      @cs.bytes(" ")[0].should == [0, 0, 0, 0, 0, 0, 0, 0]
    end
  end
end
