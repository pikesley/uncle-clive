require 'pry'

module UncleClive
  module Decorators
    class TextDecorator
      attr_accessor :on, :off

      def initialize args = {}
        @on = '1'
        @off = '0'
        @leading_dot = ''

        if args[:on]
          @on = args[:on]
        end

        if args[:off]
          @off = args[:off]
        end
      end

      def on= char
        @off = ' ' * char.length
        @leading_dot = '.'
        @on = char
      end

      def render font_generator, key
        s = ''
        font_generator.get(key).each do |line|
          s << @leading_dot
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