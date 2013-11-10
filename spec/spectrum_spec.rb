require 'spec_helper'

module Spectrum
  describe CharacterSet do
    it "should have the correct keys and values" do
      cs = CharacterSet.new
      cs.fetch("a").should == [0, 0, 56, 4, 60, 68, 60, 0]
    end

    it "should output as JSON" do
      cs = CharacterSet.new
      cs.to_json.should =~ /.*/
    end

    it "should give us a correct character" do
      cs = CharacterSet.new
      cs.get("a").should ==
          """00000000
00000000
00111000
00000100
00111100
01000100
00111100
00000000"""
    end

    it "should give us a correct string" do
      cs = CharacterSet.new
      cs.get("ab").should ==
          """0000000000000000
0000000000100000
0011100000100000
0000010000111100
0011110000100010
0100010000100010
0011110000111100
0000000000000000"""
    end

    it "should be able to handle keys like ©" do
      cs = CharacterSet.new
      cs.get("©").should ==
          """00111100
01000010
10011001
10100001
10100001
10011001
01000010
00111100"""
    end
  end
end
