[![Build Status](http://img.shields.io/travis/pikesley/uncle-clive.png)](https://travis-ci.org/pikesley/uncle-clive)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/uncle-clive.png)](https://gemnasium.com/pikesley/uncle-clive)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/uncle-clive.png)](https://coveralls.io/r/pikesley/uncle-clive)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/uncle-clive.png)](https://codeclimate.com/github/pikesley/uncle-clive)
[![License](http://img.shields.io/:license-mit-blue.png)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.png)](https://github.com/pikesley/badger)

#Uncle Clive

##Sinclair Spectrum Font as a Service

_v0.2.1_

##Introduction

You may see a more pointless Thing-as-a-Service today, but I hope not. Uncle Clive is a massively over-engineered solution to a problem that I'm _almost 100% certain does not exist_ - rendering text in the 1982 Sinclair Spectrum character set.

It's mostly an exercise in me learning how to do REST and conneg (and possibly semver).

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

Will return content of the form _:text_, rendered in the 1982 Sinclair Spectrum character set.

####`/:text/pokrovsky`

Will return content of the form _:text_, rendered in the 1982 Sinclair Spectrum character set, but compressed to fit into 7 rows thus:

* if a character has a blank top row, that row will be excised, else
* if a character has a blank bottom row, that row will be excised, else
* _rows[4]_ will be excised

The JSON form of this also has its 1s replaced by 4s, and is designed for use with [Pokrovsky](https://pokrovsky.herokuapp.com)

###Notes

See also the [`examples/png.rb`](https://github.com/pikesley/uncle-clive/blob/master/examples/png.rb) script for an example of using the excellent [chunky_png](https://github.com/wvanbergen/chunky_png) library to generate PNG images from the JSON content.

###History

This is at least the third time I've implemented this or something like it:

* [PHP version](http://toys.param3.com/sinclair/), initially written in 2003
* [Python version](http://org.orgraphone.org/2010/09/the-sinclair-spectrum-font-simulator/) from 2010
