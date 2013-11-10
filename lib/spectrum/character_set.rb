require 'json'

module Spectrum
  class CharacterSet
    attr_accessor :on_char, :off_char

    def initialize char_set_file = "conf/character_set.txt"
      @chars = {}
      @on_char = "1"
      @off_char = "0"
      File.open(char_set_file).readlines.each do |line|
        pieces = line.match(/^(.)  *(.*)/)
        key    = pieces[1]
        values = pieces[2].split(" ").map { |i| i.to_i }

        @chars[key] = values
      end
    end

    def fetch key
      @chars[key]
    end

    def get s
      a     = []
      index = 0

      s.chars.each do |u|
        self.bytes(u).each do |byte|
          begin
            a[index] << byte
          rescue NoMethodError
            a[index] = byte
          end
          index += 1
        end
        index = 0
      end

      a.join("\n").gsub("1", @on_char).gsub("0", @off_char)
    end

    def bytes s
      a = @chars[s]
      b = []
      a.each do |int|
        b << "%08d" % int.to_s(2)
      end

      b
    end

    def to_json
      JSON.generate @chars
    end
  end
end