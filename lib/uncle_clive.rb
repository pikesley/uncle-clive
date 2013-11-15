require_relative "uncle_clive/version"
require_relative "uncle_clive/font_generator"
require_relative "uncle_clive/formatters/text_formatter"
require_relative "uncle_clive/formatters/json_formatter"
require_relative "uncle_clive/formatters/html_table_formatter"
require_relative "uncle_clive/formatters/png_formatter"

require 'sinatra/base'
require 'haml'
require 'maruku'
require 'rack-google-analytics'

class Spectrum < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-20895204-11'

  get '/' do
    haml :readme, :locals => {
        :text  => markdown(File.read('README.md')),
        :title => '© 1982 Sinclair Research Ltd.'
    }
  end

  get '/:text' do
    respond params[:data]
  end

  post '/:text' do
    respond params[:text]
  end

  def respond text
    cs = UncleClive::FontGenerator.new

    request.accept.each do |type|
      case type.to_s

        when 'application/json'
          cs.formatter = UncleClive::Formatters::JSONFormatter.new
          halt cs[params[:text]]

        when 'text/html'
          cs.formatter = UncleClive::Formatters::HTMLTableFormatter.new
          halt haml :tabliser, :locals => {
              :title => params[:text],
              :table => cs[params[:text]]
          }

        when 'text/plain'
          cs.formatter    = UncleClive::Formatters::TextFormatter.new
          cs.formatter.on = "[]"
          halt cs[params[:text]]

        when 'image/png'
          cs.formatter = UncleClive::Formatters::PNGFormatter.new
          halt cs[params[:text]]

        else
          halt "Nothing to see here"
      end
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end
