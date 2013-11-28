require 'json'

module UncleClive
  class FontGenerator
    attr_accessor :formatter, :on_char, :off_char, :gitfiti

    def initialize char_set_file = "conf/character_set.txt"
      @char_set_file = char_set_file
      @chars    = {}
      @on_char  = "1"
      @off_char = "0"
      @gitfiti   = false
      get_chars
    end

    def get_chars
      File.open(@char_set_file).readlines.each do |line|
        pieces = line.match(/^(.)  *(.*)/)
        key    = pieces[1]
        values = pieces[2].split(" ").map { |i| i.to_i }

        if @gitfiti
          if values[-1] == 0
            values.pop
          elsif values[0] == 0
            values.shift
          else
            values = (values[0..3] << values[5..7]).flatten
          end
        end
        @chars[key] = values
      end
    end

    def gitfiti= bool
      @gitfiti = bool
      get_chars
    end

    def raw_data key
      @chars[key]
    end

    def fetch key
      self[key]
    end

    def [] key
      result = self.get key.to_s

      if @formatter
        @formatter.render self, key
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
