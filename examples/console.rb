#!/usr/bin/env ruby

require 'curb'
require 'uri'
require 'json'

strings  = [
    '© 1982',
    'LOAD ""'
]
on_char  = "[]"
off_char = " " * on_char.length

if ARGV[0]
  strings = [
      ARGV[0]
  ]
end

ssfaas = 'http://uncleclive.herokuapp.com/'

strings.each do |s|
  full_url = URI.join ssfaas, URI.encode(s)

  c = Curl::Easy.new("%s" % full_url)
  c.headers = {
      'Accept' => 'application/json'
  }
  c.perform
  lines = JSON::parse(c.body_str)["data"]

  lines.each do |line|
    s = line.join("")
    puts s.gsub("1", on_char).gsub("0", off_char)
  end
end
