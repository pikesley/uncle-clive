# Generated by cucumber-sinatra. (2013-11-10 13:12:16 +0000)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/uncle_clive.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = UncleClive

class SpectrumWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  SpectrumWorld.new
end