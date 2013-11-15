module UncleClive
  module Decorators
    class RunLengthEncoder
      def initialize font_generator
        @fg = font_generator

#        self.encode @fg
      end

      def [] key
        a = []

        @fg.get(key).each do |line|
          a << self.encode(line)
        end

        a
      end

      def get key
        a = []

        @fg.get(key).each do |line|
          a << self.encode(line)
        end

        a
      end

      def encode row
        result = []
        count  = 0
        step   = 0
        while step < row.length
          current = row[step]
          step    += 1
          nxt     = row[step]
          if nxt == current
            count += 1
          else
            result << {
                current => count + 1
            }
            count   = 0
            current = nxt
          end
        end

        result
      end
    end
  end
end