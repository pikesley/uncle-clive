[![Build Status](http://img.shields.io/travis/pikesley/uncle-clive.svg)](https://travis-ci.org/pikesley/uncle-clive)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/uncle-clive.svg)](https://gemnasium.com/pikesley/uncle-clive)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/uncle-clive.svg)](https://coveralls.io/r/pikesley/uncle-clive)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/uncle-clive.svg)](https://codeclimate.com/github/pikesley/uncle-clive)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg)](https://github.com/pikesley/badger)

#Uncle Clive

##Sinclair Spectrum Font as a Service

_v1.0.0_

##Introduction

You may see a more pointless Thing-as-a-Service today, but I hope not. Uncle Clive is a massively over-engineered solution to a problem that I'm _almost 100% certain does not exist_ - rendering text in the 1982 Sinclair Spectrum character set.

It's mostly an exercise in me learning how to do REST and content-negotiation (and possibly semantic-versioning) properly.

###Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

####`application/json`

Content will be returned as a JSON object thus:

    {
      "id": "© 1982",
      "data": [
        [0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],
        [1,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0],
        [1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,0],
        [1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,0,0],
        [1,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0],
        [0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,1,0],
        [0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      ]
    }

####`text/plain`

Content will be returned as plain text formatted thus:

    .      [][]          [][][][]        [][][][]        [][][][]
    .    []  []        []        []    []        []    []        []
    .        []        []        []      [][][][]                []
    .        []          [][][][][]    []        []      [][][][]
    .        []                  []    []        []    []
    .    [][][][][]      [][][][]        [][][][]      [][][][][][]

See the [`examples/console.rb`](https://github.com/pikesley/uncle-clive/blob/master/examples/console.rb) script for an example.

####`text/html`

Content will be returned as an HTML page with a Twitter Bootstrap Jumbotron containing the data rendered as a table.

###API

####`/:text`

Will return content of the form _:text_, rendered in the 1982 Sinclair Spectrum character set. I've tried to get Sinatra to render this for me but apparently I have no idea how that's supposed to work.

###Notes

See also the [`examples/png.rb`](https://github.com/pikesley/uncle-clive/blob/master/examples/png.rb) script for an example of using the excellent [chunky_png](https://github.com/wvanbergen/chunky_png) library to generate PNG images from the JSON content.

###History

This is at least the third time I've implemented this or something like it:

* [PHP version](http://toys.param3.com/sinclair/), initially written in 2003
* [Python version](http://org.orgraphone.org/2010/09/the-sinclair-spectrum-font-simulator/) from 2010
