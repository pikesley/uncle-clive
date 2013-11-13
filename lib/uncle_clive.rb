require_relative "uncle_clive/version"
require_relative "uncle_clive/font_generator"
require_relative "uncle_clive/decorators/text_decorator"
require_relative "uncle_clive/decorators/json_decorator"
require_relative "uncle_clive/decorators/html_table_decorator"
require 'sinatra/base'
require 'haml'

class Spectrum < Sinatra::Base
  get '/' do
    haml :index
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
          cs.decorator = UncleClive::Decorators::JSONDecorator.new
          halt cs[params[:text]]
        else
          halt "Nope"
#          halt cs.get_json(params[:text])
      end
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end
