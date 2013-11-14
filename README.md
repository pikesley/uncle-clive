[![Build Status](https://api.travis-ci.org/pikesley/uncle-clive.png)](https://travis-ci.org/pikesley/uncle-clive)
[![Code Climate](https://codeclimate.com/github/pikesley/uncle-clive.png)](https://codeclimate.com/github/pikesley/uncle-clive)
[![Dependency Status](https://gemnasium.com/pikesley/uncle-clive.png)](https://gemnasium.com/pikesley/uncle-clive)

#Uncle Clive

##Sinclair Spectrum Font as a Service

_v0.0.1_

##Introduction

You may see a more pointless Thing-as-a-Service today, but I hope not. Uncle Clive is a massively over-engineered solution to a problem that I'm _almost 100% certain does not exist_ - rendering text in the 1982 Sinclair Spectrum character set.

It's mostly an exercise in me learning how to do REST and conneg (and possibly semver).

It's running at [http://uncleclive.herokuapp.com/](http://uncleclive.herokuapp.com/)

###Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

####application/json

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

####text/plain

Content will be returned as plain text formatted thus:

    .      [][]          [][][][]        [][][][]        [][][][]
    .    []  []        []        []    []        []    []        []
    .        []        []        []      [][][][]                []
    .        []          [][][][][]    []        []      [][][][]
    .        []                  []    []        []    []
    .    [][][][][]      [][][][]        [][][][]      [][][][][][]

See `examples/console.rb` for an example.

####text/html

Content will be returned as an HTML page with a Twitter Bootstrap hero unit containing the data rendered as a table.

###API

####/:text

Will return content of the form _:text_, rendered in the 1982 Sinclair Spectrum character set.

###Roadmap

In the future, Uncle-Clive may:

* allow setting of colour and cell-size for the _application/html_ rendering
* allow modifications of the character set on-the-fly to make the _application/json_ rendering useful for [Gitfiti](https://github.com/gelstudios/gitfiti) (which is kind of why I started doing this in the first place)

###History

This is at least the third time I've implemented this or something like it:

* [PHP version](http://toys.param3.com/sinclair/), initially written in 2003
* [Python version](http://org.orgraphone.org/2010/09/the-sinclair-spectrum-font-simulator/) from 2010