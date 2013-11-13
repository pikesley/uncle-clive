require_relative "uncle_clive/version"
require_relative "uncle_clive/font_generator"
require_relative "uncle_clive/decorators/text_decorator"
require_relative "uncle_clive/decorators/json_decorator"
require_relative "uncle_clive/decorators/html_table_decorator"
require 'sinatra/base'
require 'haml'

class Spectrum < Sinatra::Base
  @@cs = UncleClive::FontGenerator.new

  get '/' do
    @@cs.decorator = UncleClive::Decorators::HTMLTableDecorator.new
    haml :index, :locals => {
        :title => '© 1982 Sinclair Research Ltd.',
        :table => @@cs["Hello"]
    }
  end

  get '/:text' do
#    puts ">>> %s <<<" % request.accept
    cs = UncleClive::FontGenerator.new
    request.accept.each do |type|
      case type.to_s
        when 'application/json'
          cs.decorator = UncleClive::Decorators::JSONDecorator.new
          halt cs[params[:text]]

        when 'text/html'
          cs.decorator = UncleClive::Decorators::HTMLTableDecorator.new
          halt haml :index, :locals => {
              :title => params[:text],
              :table => cs[params[:text]]
          }

        when 'text/text'
          cs.decorator = UncleClive::Decorators::TextDecorator.new
          cs.decorator.on = "[]"
          halt cs[params[:text]]

        else
          halt "Nope"
      end
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end
