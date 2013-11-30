require_relative 'uncle_clive/version'
require_relative 'uncle_clive/font_generator'
require_relative 'uncle_clive/formatters/text_formatter'
require_relative 'uncle_clive/formatters/json_formatter'
require_relative 'uncle_clive/formatters/html_table_formatter'
require_relative 'uncle_clive/formatters/png_formatter'
require_relative 'uncle_clive/decorators/run_length_encoder'

require 'sinatra/base'
require 'haml'
require 'kramdown'
require 'rack-google-analytics'

class Spectrum < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-20895204-11'

  get '/' do
    haml :readme, :locals => {
        :bootstrap_theme => '../lavish-bootstrap.css',
        :title           => '© 1982 Sinclair Research Ltd.',
        :text            => markdown(File.read('README.md'))
    }
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

  get '/:text/gitfiti' do
    respond params[:text], true
  end

  post '/:text/gitfiti' do
    respond params[:text], true
  end

  def respond text, gitfiti = false
    cs         = UncleClive::FontGenerator.new
    cs.gitfiti = gitfiti

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
