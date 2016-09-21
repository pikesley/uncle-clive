[![Build Status](http://img.shields.io/travis/pikesley/uncle-clive.svg?style=flat-square)](https://travis-ci.org/pikesley/uncle-clive)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/uncle-clive.svg?style=flat-square)](https://gemnasium.com/pikesley/uncle-clive)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/uncle-clive.svg?style=flat-square)](https://coveralls.io/r/pikesley/uncle-clive)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/uncle-clive.svg?style=flat-square)](https://codeclimate.com/github/pikesley/uncle-clive)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)

![Uncle Clive](http://uncleclive.herokuapp.com/Uncle%20Clive.svg?colour=fa8100)

##Sinclair Spectrum Font as a Service

_v2.0.0_

##Introduction

You may see a more pointless Thing-as-a-Service today, but I hope not. Uncle Clive is a massively over-engineered solution to a problem that I'm _almost 100% certain does not exist_ - rendering text in the 1982 Sinclair Spectrum character set

This has now been completely rewritten to make use of my new [1982](http://sam.pikesley.org/projects/1982/) gem, and my [Skellington](http://sam.pikesley.org/projects/skellington/) Sinatra-app-generation tool

###Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

####`application/json` _[example](http://uncleclive.herokuapp.com/1982.json)_

Content will be returned as a JSON object

####`text/plain` _[example](http://uncleclive.herokuapp.com/1982.text)_

Content will be returned as plain text

####`text/html` _[example](http://uncleclive.herokuapp.com/%C2%A9%201982%20Sinclair%20Research%20Ltd)_

Content will be returned as an HTML page with a Twitter Bootstrap Jumbotron containing the data rendered as a table

####`image/svg+xml` _[example](http://uncleclive.herokuapp.com/%C2%A9%201982%20Sinclair%20Research%20Ltd.svg?colour=fa8100)_

Content will be returned as an SVG image

###API

####`/:text`

Will return content of the form _:text_, rendered in the 1982 Sinclair Spectrum character set.

###History

This is at least the third time I've implemented this or something like it:

* PHP version, initially written in 2003, now lost to the mists of time
* [Python version](http://org.orgraphone.org/2010/09/the-sinclair-spectrum-font-simulator/) from 2010
