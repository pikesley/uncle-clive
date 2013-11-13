require_relative "uncle_clive/version"
require_relative "uncle_clive/font_generator"
require 'sinatra/base'

class Spectrum < Sinatra::Base
  get '/' do
    "Nothing to see here. Try adding some text onto the end of the URL"
  end

  get '/:text' do
    cs = UncleClive::FontGenerator.new
    request.accept.each do |type|
      case type.to_s
        when 'application/json'
          halt cs.get_json(params[:text])
        when 'application/html'
          halt cs.get_json(params[:text])
        else
          p halt cs.get_json(params[:text])

      end
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end
