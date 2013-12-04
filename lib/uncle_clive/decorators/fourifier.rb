module UncleClive
  module Decorators
    class Fourifier
      def initialize font_generator
        @fg = font_generator
      end

      def [] key
        a = []

        @fg.get(key).each do |line|
          a << (line.map { |i| i * 4 })
        end

        a
      end

      def get key
        a = []

        @fg.get(key).each do |line|
          a << (line.map { |i| i * 4 })
        end

        a
      end
    end
  end
end