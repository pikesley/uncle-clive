module UncleClive
  module Decorators
    class JSONDecorator
      def render font_generator, key
        {
            :id   => key.to_s,
            :data => font_generator.get(key)
        }.to_json
      end
    end
  end
end