require 'json'
require 'pry'

module UncleClive
  class FontGenerator
    attr_accessor :decorator, :on_char, :off_char

    def initialize char_set_file = "conf/character_set.txt"
      @chars    = {}
      @on_char  = "1"
      @off_char = "0"
      File.open(char_set_file).readlines.each do |line|
        pieces = line.match(/^(.)  *(.*)/)
        key    = pieces[1]
        values = pieces[2].split(" ").map { |i| i.to_i }

        @chars[key] = values
      end
    end

    def raw_data key
      @chars[key]
    end

    def fetch key
      @chars[key]
    end

    def [] key
      result = self.get key.to_s

      if @decorator
        @decorator.render self, key
      else
        result
      end
    end

    def get s
      a     = []
      index = 0

      s.chars.each do |u|
        self.bytes(u).each do |byte|
          begin
            a[index] += byte
          rescue NameError
            a[index] = byte
          end
          index += 1
        end
        index = 0
      end

      a
    end

    def bytes s
      a = @chars[s] ||= @chars[" "]
      b = []
      a.each do |int|
        b << ("%08d" % int.to_s(2)).split("").map { |i| i.to_i }
      end

      b
    end
  end
end
