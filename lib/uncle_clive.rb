require_relative "uncle_clive/version"
require_relative "uncle_clive/font_generator"
require_relative "uncle_clive/formatters/text_formatter"
require_relative "uncle_clive/formatters/json_formatter"
require_relative "uncle_clive/formatters/html_table_formatter"
require 'sinatra/base'
require 'haml'

class Spectrum < Sinatra::Base
  @@cs = UncleClive::FontGenerator.new
  @@title = '© 1982 Sinclair Research Ltd.'

  get '/' do
    @@cs.formatter = UncleClive::Formatters::HTMLTableFormatter.new
    haml :index, :locals => {
        :title => @@title,
        :table => @@cs[@@title]
    }
  end

  get '/:text' do
#    puts ">>> %s <<<" % request.accept
    cs = UncleClive::FontGenerator.new
    request.accept.each do |type|
      case type.to_s
        when 'application/json'
          cs.formatter = UncleClive::Formatters::JSONFormatter.new
          halt cs[params[:text]]

        when 'text/html'
          cs.formatter = UncleClive::Formatters::HTMLTableFormatter.new
          halt haml :index, :locals => {
              :title => @@title,
              :table => cs[params[:text]]
          }

        when 'text/plain'
          cs.formatter = UncleClive::Formatters::TextFormatter.new
          cs.formatter.on = "[]"
          halt cs[params[:text]]

        else
          halt "Nope"
      end
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end
