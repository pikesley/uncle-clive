require 'sinatra/base'
require 'tilt/erubis'
require 'json'
require 'yaml'
require 'kramdown'

require 'nineteen/eighty/two'

require_relative 'uncle_clive/helpers'
require_relative 'uncle_clive/racks'

module UncleClive
  class App < Sinatra::Base
    helpers do
      include UncleClive::Helpers
    end

    get '/' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @content = '<h1>Hello from UncleClive</h1>'
          @title = 'UncleClive'
          @github_url = CONFIG['github_url']
          erb :index, layout: :default
        end
      end
    end

    get '/:text' do
      headers( 'Access-Control-Allow-Origin' => '*' )
      
      respond_to do |wants|
        wants.json do
          Nineteen::Eighty::Two::Formats::JSON.format params[:text]
        end

        wants.svg do
          Nineteen::Eighty::Two::Formats::SVG.format params[:text]
        end

        wants.text do
          Nineteen::Eighty::Two::Formats::Text.format params[:text], {on: '()', off: '  '}
        end

        wants.html do
          @content = Nineteen::Eighty::Two::Formats::HTMLTable.format params[:text]
          erb :table, layout: :default
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
