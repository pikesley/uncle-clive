require_relative "uncle_clive/version"
require_relative "uncle_clive/character_set"
require 'sinatra/base'

class Spectrum < Sinatra::Base
  get '/' do
    "Nothing to see here. Try adding some text onto the end of the URL"
  end

  get '/:text' do
    cs = UncleClive::CharacterSet.new
    cs.get_json(params[:text].to_s)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
