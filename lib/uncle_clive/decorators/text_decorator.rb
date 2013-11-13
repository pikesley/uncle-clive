module UncleClive
  module Decorators
    class TextDecorator
      def initialize args = {}
        @on  = args[:on] ||= '1'
        @off = args[:off] ||= '0'
      end

      def render font_generator, key
        s = ''
        font_generator.get(key).each do |line|
          line.each do |bit|
            case bit
              when 1
                s << @on
              when 0
                s << @off
            end

          end
          s << "\n"
        end
        s.strip
      end
    end
  end
end