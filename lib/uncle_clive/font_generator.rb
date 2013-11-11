require 'json'

module UncleClive
  class FontGenerator
    attr_accessor :on_char, :off_char

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

    def fetch key
      @chars[key]
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

    def get_txt s
      t = self.get(s)
      t.map! { |u| u.join("")}
      t.join("\n").gsub("1", @on_char).gsub("0", @off_char)
    end

    def bytes s
      a = @chars[s] ||= @chars[" "]
      b = []
      a.each do |int|
        b << ("%08d" % int.to_s(2)).split("").map { |i| i.to_i }
      end

      b
    end

    def get_json s
      h = {}
      h[:id] = s
      h[:data] = self.get(s)

      h.to_json
    end
  end
end
