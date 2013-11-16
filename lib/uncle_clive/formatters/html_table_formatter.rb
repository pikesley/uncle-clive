module UncleClive
  module Formatters
    class HTMLTableFormatter
      attr_accessor :rle

      def initialize
        @rle = true
      end

      def render font_generator, key
        if @rle
          font_generator = UncleClive::Decorators::RunLengthEncoder.new font_generator
        end
        s = '<!-- %s -->' % key
        s << '<table class="sinclair">'

        lines = font_generator.get(key)
        if @rle
          lines << make_blanks(key)
        end

        lines.each { |line| s << build_row(line) }

        s << '</table>'
        s
      end

      def make_blanks key
        a = []
        (key.length * 8).times do |bit|
          a << { 0 => 1 }
        end

        a
      end

      def convert_line line
        line.map! { |i|
          {
              :class   => i.keys[0] == 1 ? "on" : "off",
              :colspan => i.values[0]
          }
        }
      end

      def build_row line
        s = '<tr class="sinclair">'

        if not @rle
          line.map! { |i| { i => 1 } }
        end

        convert_line line

        line.each do |bit|
          s << '<td class="%s"' % bit[:class]
          if bit[:colspan] > 1
            s << ' colspan="%d"' % bit[:colspan]
          end
          s << '> </td>'
        end

        s << '</tr>'
      end
    end
  end
end