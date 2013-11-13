module UncleClive
  module Decorators
    class HTMLTableDecorator
      def render font_generator, key
        s = '<table>'

        font_generator.get(key).each do |line|
          s << '<tr>'
          line.each do |bit|
            s << '<td class="%s"> </td>' % (
            bit == 1 ? "on" : "off"
            )
          end
          s << '</tr>'
        end

        s << '</table>'

        s
      end
    end
  end
end