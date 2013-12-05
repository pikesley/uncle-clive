require_relative 'uncle_clive/version'
require_relative 'uncle_clive/font_generator'
require_relative 'uncle_clive/formatters/text_formatter'
require_relative 'uncle_clive/formatters/json_formatter'
require_relative 'uncle_clive/formatters/html_table_formatter'
require_relative 'uncle_clive/formatters/png_formatter'
require_relative 'uncle_clive/decorators/run_length_encoder'
require_relative 'uncle_clive/decorators/fourifier'

require 'sinatra/base'
require 'haml'
require 'kramdown'
require 'rack-google-analytics'

class Spectrum < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-20895204-11'

  @@locals = {
      :bootstrap_theme   => '../lavish-bootstrap.css',
      :additional_styles => [
          '../sinclair.css'
      ],
      :github            => {
          :user    => 'pikesley',
          :project => 'uncle-clive',
          :ribbon  => 'right_darkblue_121621'
      }
  }

  get '/' do
    haml :readme, :locals => @@locals.merge(
        {
            :title => '© 1982 Sinclair Research Ltd.'
        }
    )
  end

  get '/:text' do
    respond params[:data]
  end

  post '/:text' do
    respond params[:text]
  end

  get '/:text/pokrovsky' do
    respond params[:text], true
  end

  post '/:text/pokrovsky' do
    respond params[:text], true
  end

  def respond text, pokvrosky = false
    cs           = UncleClive::FontGenerator.new
    cs.pokrovsky = pokvrosky

    request.accept.each do |type|
      case type.to_s

        when 'application/json'
          cs.formatter = UncleClive::Formatters::JSONFormatter.new
          halt cs[params[:text]]

        when 'text/html'
          cs.formatter = UncleClive::Formatters::HTMLTableFormatter.new
          halt haml :tabliser, :locals => @@locals.merge(
              {
                  :title => params[:text],
                  :table => cs[params[:text]]
              }
          )

        when 'text/plain'
          cs.formatter    = UncleClive::Formatters::TextFormatter.new
          cs.formatter.on = "[]"
          halt cs[params[:text]]

        when 'image/png'
          cs.formatter = UncleClive::Formatters::PNGFormatter.new
          attachment
          content_type 'image/png'
          send_file cs[params[:text]].to_blob, :type => :png

        else
          halt "Nothing to see here"
      end
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end
