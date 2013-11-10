#!/usr/bin/env ruby

require 'curb'
require 'uri'
require 'json'

text = "© 1982 Sinclair Research Ltd."
text = "© 1982"
if ARGV[0]
  text = ARGV[0]
end

ssfaas = 'http://uncleclive.herokuapp.com/'
full_url = URI.join ssfaas, URI.encode(text)

c = Curl::Easy.new("%s" % full_url)
c.perform
lines = JSON::parse(c.body_str)["data"]

lines.each do |line|
  s = line.join("")
  puts s.gsub("1", "[]").gsub("0", "  ")
end
