require 'coveralls'
Coveralls.wear_merged!

require 'rack/test'
require 'uncle_clive'

JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }
TEXT_HEADERS = { 'HTTP_ACCEPT' => 'text/plain' }
SVG_HEADERS = { 'HTTP_ACCEPT' => 'image/svg+xml' }
V1_HEADERS = { 'API-Version' => 1 }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random

  include Rack::Test::Methods
  def app
    UncleClive::App
  end
end
