#!/usr/bin/env ruby

require 'curb'
require 'uri'
require 'json'

strings = [
    '© 1982',
    'LOAD ""'
]

if ARGV[0]
  strings = [
      ARGV[0]
  ]
end

ssfaas = 'http://uncleclive.herokuapp.com/'
#ssfaas = 'http://localhost:4567/'

strings.each do |s|
  full_url = URI.join ssfaas, URI.encode(s)

  c         = Curl::Easy.new("%s" % full_url)
  c.headers = {
      'Accept' => 'text/plain'
  }
  c.perform

  puts c.body
end
