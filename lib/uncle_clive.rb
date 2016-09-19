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
          @title = '© 1982 Sinclair Research Ltd.'
          @github_url = CONFIG['github_url']
          erb :index, layout: :default
        end
      end
    end

    get '/font/:text' do
      headers( 'Access-Control-Allow-Origin' => '*' )

      text = cleave params[:text], separator: params.fetch('line-separator', '---')

      respond_to do |wants|
        wants.json do
          Nineteen::Eighty::Two::Formats::JSON.format text
        end

        wants.svg do
          Nineteen::Eighty::Two::Formats::SVG.format text, {colour: "##{params.fetch('colour', '000000')}"}
        end

        wants.text do
          Nineteen::Eighty::Two::Formats::Text.format text, {on: '()', off: '  '}
        end

        wants.html do
          @content = Nineteen::Eighty::Two::Formats::HTMLTable.format text
          erb :table, layout: :default
        end
      end
    end

    get '/colours/:colour' do
      headers 'Access-Control-Allow-Origin' => '*'

      colour = params.fetch 'colour'
      hex = Nineteen::Eighty::Two::Colours[colour]

      respond_to do |wants|
        wants.text do
          hex
        end

        wants.other do
          {
            'id' => colour,
            'hex' => hex
          }.to_json
        end
      end
    end

    get '/messages/:key' do
      headers 'Access-Control-Allow-Origin' => '*'

      key = params.fetch 'key'
      message = Nineteen::Eighty::Two::Messages[key]

      respond_to do |wants|
        wants.text do
          message  
        end

        wants.other do
          {
            'id' => key,
            'message' => message
          }.to_json
        end
      end
    end

    get '/:text' do
      headers( 'Access-Control-Allow-Origin' => '*' )

      text = cleave params[:text], separator: params.fetch('line-separator', '---')

      respond_to do |wants|
        wants.json do
          Nineteen::Eighty::Two::Formats::JSON.format text
        end

        wants.svg do
          Nineteen::Eighty::Two::Formats::SVG.format text, {colour: "##{params.fetch('colour', '000000')}"}
        end

        wants.text do
          Nineteen::Eighty::Two::Formats::Text.format text, {on: '()', off: '  '}
        end

        wants.html do
          @content = Nineteen::Eighty::Two::Formats::HTMLTable.format text
          erb :table, layout: :default
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
