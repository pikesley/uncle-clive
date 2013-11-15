#!/usr/bin/env ruby

require 'chunky_png'
require 'curb'
require 'json'

ssfaas   = 'http://uncleclive.herokuapp.com/'
pixel_size = 8
colour = "#000000"
outfile = "/tmp/sinclair.png"
s        = 'R Tape loading error'

if ARGV[0]
  s = [
      ARGV[0]
  ]
end

full_url = URI.join ssfaas, URI.encode(s)

c         = Curl::Easy.new("%s" % full_url)
c.headers = {
    'Accept' => 'application/json'
}
c.perform

lines = JSON::parse(c.body_str)['data']
image = ChunkyPNG::Canvas.new((lines[0].length) * pixel_size, lines.length * pixel_size)

x = 0
y = 0
lines.each do |line|
  line.each do |bit|
    case bit.to_i
      when 1
        image.rect x, y, x + pixel_size - 1, y + pixel_size - 1, colour, colour
    end
    x += pixel_size
  end
  x = 0
  y += pixel_size
end

image.save outfile

puts "File %s saved" % [
    outfile
]

puts "On a Mac, try\n    open %s" % [
    outfile
]
