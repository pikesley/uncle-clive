require 'spec_helper'

module UncleClive
  describe FontGenerator do
    before :each do
      @cs = FontGenerator.new
      @cs.decorator = UncleClive::Decorators::TextDecorator.new
    end

    it "should give us a correct character" do
      @cs["a"].should ==
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
      @cs["ab"].should ==
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
      @cs["©"].should ==
          """00111100
01000010
10011001
10100001
10100001
10011001
01000010
00111100"""
    end

    it "should recognise ' ' as a key" do
      @cs[" "].should ==
          """00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000"""
    end

    it "should return characters other than 0's and 1's" do
      @cs.decorator = UncleClive::Decorators::TextDecorator.new({:on => 'X', :off => '.'})
      @cs["Sam"].should ==
          """........................
..XXXX..................
.X........XXX....XX.X...
..XXXX.......X...X.X.X..
......X...XXXX...X.X.X..
.X....X..X...X...X.X.X..
..XXXX....XXXX...X.X.X..
........................"""
    end
  end
end
