require 'spec_helper'

module UncleClive
  describe CharacterSet do
    it "should have the correct keys and values" do
      cs = CharacterSet.new
      cs.fetch("a").should == [0, 0, 56, 4, 60, 68, 60, 0]
    end

    it "should give us an array of bits" do
      cs = CharacterSet.new
      cs.bytes(" ")[0].should == [0, 0, 0, 0, 0, 0, 0, 0]
    end

    it "should give us a correct character"  do
      cs = CharacterSet.new
      cs.get_txt("a").should ==
          "" "00000000
00000000
00111000
00000100
00111100
01000100
00111100
00000000" ""
    end

    it "should give us a correct string" do
      cs = CharacterSet.new
      cs.get_txt("ab").should ==
          "" "0000000000000000
0000000000100000
0011100000100000
0000010000111100
0011110000100010
0100010000100010
0011110000111100
0000000000000000" ""
    end

    it "should be able to handle keys like ©" do
      cs = CharacterSet.new
      cs.get_txt("©").should ==
          "" "00111100
01000010
10011001
10100001
10100001
10011001
01000010
00111100" ""
    end

    it "should recognise ' ' as a key" do
      cs = CharacterSet.new
      cs.get_txt(" ").should ==
          "" "00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000" ""
    end

    it "should return characters other than 0's and 1's" do
      cs          = CharacterSet.new
      cs.on_char  = "X"
      cs.off_char = "."
      cs.get_txt("Sam").should ==
          "" "........................
..XXXX..................
.X........XXX....XX.X...
..XXXX.......X...X.X.X..
......X...XXXX...X.X.X..
.X....X..X...X...X.X.X..
..XXXX....XXXX...X.X.X..
........................" ""
    end

    it "should return JSON" do
      cs = CharacterSet.new
      cs.get_json(" ").should == {
          :id   => " ",
          :data => [
              [0, 0, 0, 0, 0, 0, 0, 0],
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

    it "should return JSON for longer strings" do
      cs = CharacterSet.new
      cs.get_json("1982").should == {
          :id   => "1982",
          :data => [
              [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0],
              [0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0],
              [0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
              [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0],
              [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0],
              [0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0],
              [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          ]
      }.to_json
    end
  end
end
