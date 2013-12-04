module UncleClive
  module Formatters
    class JSONFormatter
      def render font_generator, key
        if font_generator.pokrovsky
          font_generator = UncleClive::Decorators::Fourifier.new font_generator
        end
        {
            :id   => key.to_s,
            :data => font_generator.get(key)
        }.to_json
      end
    end
  end
end