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
require 'rack/conneg'

class Spectrum < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-20895204-11'

  use Rack::Conneg do |conneg|
    conneg.set :accept_all_extensions, false
    conneg.set :fallback, :html
    conneg.ignore('/css/')
    conneg.provide [
      :html,
      :json,
      :text,
      :png
    ]
  end

  @@locals = {
#      :bootstrap_theme   => '../lavish-bootstrap.css',
      :additional_styles => [
          '../sinclair.css'
      ],
      :github            => {
          :user    => 'pikesley',
          :project => 'uncle-clive',
          :ribbon  => 'right_gray_6d6d6d'
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
    cs           = UncleClive::FontGenerator.new

    respond_to do |wants|
      wants.json do
        cs.formatter = UncleClive::Formatters::JSONFormatter.new
        cs[params[:text]]
      end

      wants.html do
        cs.formatter = UncleClive::Formatters::HTMLTableFormatter.new
        haml :tabliser, :locals => @@locals.merge(
          {
            :title => params[:text],
            :table => cs[params[:text]]
          }
        )
      end

      wants.text do
        cs.formatter    = UncleClive::Formatters::TextFormatter.new
        cs.formatter.on = "[]"
        cs[params[:text]]
      end

      wants.png do
        cs.formatter = UncleClive::Formatters::PNGFormatter.new
        content_type 'image/png'
        f = File.open('x.png', 'w')
        f.write cs[params[:text]]
        f.close
        redirect '/x.png'
      end
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end
