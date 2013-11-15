require 'chunky_png'

module UncleClive
  module Formatters
    class PNGFormatter
      attr_accessor :colour, :size

      def initialize args = {}
        @colour = args[:colour] ||= '#000000'
        @size   = args[:size].to_i ||= 8
      end

      def render font_generator, key
        lines = font_generator.get(key)
        image = ChunkyPNG::Canvas.new((lines[0].length) * @size, lines.length * @size)
        x     = 0
        y     = 0

        lines.each do |line|
          line.each do |bit|
            case bit.to_i
              when 1
                image.rect x, y, x + @size - 1, @size - 1, @colour, @colour
            end
            x += 1
          end
          x = 0
          y += 1
        end

        image
      end
    end
  end
end