![Uncle Clive](/font/Uncle%20Clive.svg?colour=fa8100)

## Sinclair Spectrum Stuff as a Service

_v2.0.0_

## Introduction

You may see a more pointless Thing-as-a-Service today, but I hope not. Uncle Clive is a massively over-engineered solution to a problem that I'm _almost 100% certain does not exist_ - rendering text in the 1982 Sinclair Spectrum character set

This has now been completely rewritten to make use of my new [1982](https://sam.pikesley.org/projects/1982/) gem

## API

### `/font/:text`

Will return content of the form _:text_, rendered in the 1982 Sinclair Spectrum character set.

#### Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

##### `application/json` _[example](/font/1982.json)_

Content will be returned as a JSON object

##### `text/plain` _[example](/font/1982.text)_

Content will be returned as plain text

##### `text/html` _[example](/font/%C2%A9%201982%20Sinclair%20Research%20Ltd)_

Content will be returned as an HTML page with a Twitter Bootstrap Jumbotron containing the data rendered as a table

##### `image/svg+xml` _[example](/font/%C2%A9%201982%20Sinclair%20Research%20Ltd.svg?colour=fa8100)_

Content will be returned as an SVG image

---

### `/colours/:colour`

Will return the hex value of the requested colour

### `/colours/:COLOUR`

Will return the BRIGHT variant of the requested colour

#### Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

##### `application/json` _[example](/colours/magenta)_

Content will be returned as a JSON object (this is the default if no _Accept_ header is sent)

##### `text/plain` _[example](/colours/YELLOW.text)_

The hex value will be returned as plain text

---

### `/messages/:key`

Will return the Spectrum error message corresponding to _:key_

#### Content negotiation

Uncle-Clive will respond to the following _Accept_ values with appropriate content:

##### `application/json` _[example](/messages/r)_

Content will be returned as a JSON object (this is the default if no _Accept_ header is sent)

##### `text/plain` _[example](/messages/C.text)_

The error message will be returned as plain text

---

### History

This is at least the third time I've implemented this or something like it:

* PHP version, initially written in 2003, now lost to the mists of time
* [Python version](https://org.orgraphone.org/2010/09/the-sinclair-spectrum-font-simulator/) from 2010
