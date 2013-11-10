require_relative "uncle_clive/version"
require_relative "uncle_clive/character_set"
require 'sinatra/base'

class Spectrum < Sinatra::Base
  get '/:text' do
    cs = UncleClive::CharacterSet.new
    cs.get_json(params[:text].to_s)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
