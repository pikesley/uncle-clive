require "uncle_clive/version"
require "uncle_clive/character_set"
require 'sinatra/base'

class Spectrum < Sinatra::Base
  get '/' do
    'Hello UncleClive!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
