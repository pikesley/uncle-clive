[![Build Status](https://img.shields.io/travis/pikesley/uncle-clive.svg?style=flat-square)](https://travis-ci.org/pikesley/uncle-clive)
[![Dependency Status](https://img.shields.io/gemnasium/pikesley/uncle-clive.svg?style=flat-square)](https://gemnasium.com/pikesley/uncle-clive)
[![Coverage Status](https://img.shields.io/coveralls/pikesley/uncle-clive.svg?style=flat-square)](https://coveralls.io/r/pikesley/uncle-clive)
[![Code Climate](https://img.shields.io/codeclimate/github/pikesley/uncle-clive.svg?style=flat-square)](https://codeclimate.com/github/pikesley/uncle-clive)
[![License](https://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://pikesley.mit-license.org)

![Uncle Clive](https://uncleclive.herokuapp.com/font/Uncle%20Clive.svg?colour=fa8100)

##Sinclair Spectrum Stuff as a Service

_v2.0.0_

##Introduction

You may see a more pointless Thing-as-a-Service today, but I hope not. Uncle Clive is a massively over-engineered solution to a problem that I'm _almost 100% certain does not exist_ - rendering text in the 1982 Sinclair Spectrum character set

This has now been completely rewritten to make use of my new [1982](https://sam.pikesley.org/projects/1982/) gem, and my [Skellington](https://sam.pikesley.org/projects/skellington/) Sinatra-app-generation tool

##API

###`/font/:text`

Will return content of the form _:text_, rendered in the 1982 Sinclair Spectrum character set.

####Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

#####`application/json` _[example](https://uncleclive.herokuapp.com/font/1982.json)_

Content will be returned as a JSON object

#####`text/plain` _[example](https://uncleclive.herokuapp.com/font/1982.text)_

Content will be returned as plain text

#####`text/html` _[example](https://uncleclive.herokuapp.com/font/%C2%A9%201982%20Sinclair%20Research%20Ltd)_

Content will be returned as an HTML page with a Twitter Bootstrap Jumbotron containing the data rendered as a table

#####`image/svg+xml` _[example](https://uncleclive.herokuapp.com/font/%C2%A9%201982%20Sinclair%20Research%20Ltd.svg?colour=fa8100)_

Content will be returned as an SVG image

---

###`/colours/:colour`

Will return the hex value of the requested colour

###`/colours/:COLOUR`

Will return the BRIGHT variant of the requested colour

####Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

#####`application/json` _[example](https://uncleclive.herokuapp.com/colours/magenta)_

Content will be returned as a JSON object (this is the default if no _Accept_ header is sent)

#####`text/plain` _[example](https://uncleclive.herokuapp.com/colours/YELLOW.text)_

The hex value will be returned as plain text

---

###`/messages/:key`

Will return the Spectrum error message corresponding to _:key_

####Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

#####`application/json` _[example](https://uncleclive.herokuapp.com/messages/r)_

Content will be returned as a JSON object (this is the default if no _Accept_ header is sent)

#####`text/plain` _[example](https://uncleclive.herokuapp.com/messages/C.text)_

The error message will be returned as plain text

---

###History

This is at least the third time I've implemented this or something like it:

* PHP version, initially written in 2003, now lost to the mists of time
* [Python version](https://org.orgraphone.org/2010/09/the-sinclair-spectrum-font-simulator/) from 2010
