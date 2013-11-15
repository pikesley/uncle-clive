require 'chunky_png'

module UncleClive
  module Formatters
    class PNGFormatter
      attr_accessor :colour, :size

      def initialize args = {}
        @colour = args[:colour] ||= '#000000'
        @size   = args[:size] ||= 8
        @image
      end

      def render font_generator, key
        puts @size
        lines = font_generator.get(key)
        @image = ChunkyPNG::Canvas.new((lines[0].length) * @size, lines.length * @size)
        x     = 0
        y     = 0

        lines.each do |line|
          line.each do |bit|
            case bit.to_i
              when 1
                @image.rect x, y, x + @size - 1, @size - 1, @colour, @colour
            end
            x += @size
          end
          x = 0
          y += @size
        end

        @image
      end

      def save path = "/tmp/png.png"
        @image.save path
      end
    end
  end
end