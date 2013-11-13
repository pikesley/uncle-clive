# Uncle Clive

## Sinclair Spectrum Font as a Service

### Because my nostalgia for the Spectrum knows no bounds

[![Build Status](https://api.travis-ci.org/pikesley/uncle-clive.png)](https://travis-ci.org/pikesley/uncle-clive)
[![Code Climate](https://codeclimate.com/github/pikesley/uncle-clive.png)](https://codeclimate.com/github/pikesley/uncle-clive)
[![Dependency Status](https://gemnasium.com/pikesley/uncle-clive.png)](https://gemnasium.com/pikesley/uncle-clive)

You may see a more pointless Thing-as-a-Service today, but I hope not. Mostly an exercise in me learning how to do REST and conneg (and possibly semver)

It's running at [http://uncleclive.herokuapp.com/](http://uncleclive.herokuapp.com/)

##Content negotiation

###JSON

Try `curl -H 'Accept: application/json' "http://uncleclive.herokuapp.com/%C2%A9%201982"`

to get back something like

```
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
```

###HTML

Hit the [same URL](http://uncleclive.herokuapp.com/%C2%A9%201982) with a browser to see it rendered with as an HTML table

###Text

If you hit it with `Accept: text/text` then you'll get back something like

```
.
.      [][]          [][][][]        [][][][]        [][][][]
.    []  []        []        []    []        []    []        []
.        []        []        []      [][][][]                []
.        []          [][][][][]    []        []      [][][][]
.        []                  []    []        []    []
.    [][][][][]      [][][][]        [][][][]      [][][][][][]
.
```

See `examples/console.rb` for a (hacky) example of this one