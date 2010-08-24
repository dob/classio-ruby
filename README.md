classio-ruby -- a ruby wrapper around the classio open classifieds api.
=======================================================================

## DESCRIPTION

classio-ruby is a ruby wrapper built on top of the classio open
classifieds api. 

It is bi-directional in that it lets you easily push your classified
listings into classio, and it also lets you retrieve listings from
classio using various search criteria.


## INSTALLATION

Install classio-ruby using RubyGems. The gem is hosted on
rubygems.org, so ensure that is in your gem sources.

    $ sudo gem install classio-ruby


## USAGE

You can use classio-ruby for two purposes:
Push your existing classified listings into the classio platform
Search listings within classio and pull out the results for use within
your own application

    classio = Classio::API.new(api_key)
    listing = Classio::Listing.new(:title => "2BR in Chelsea Overlooking the Hudson",
    :description =>
    "Love this place",
    :category_id => 1,   # housing,
    :url => "http://jumppost.com/apartments/23",
    :source => "jumppost.com",
    :expiration_date => "2010 11-01",
    :for_sale => true,
    :price => 3000 )
    classio.insert_listing(listing)


## LICENSE

(The MIT License)

Copyright (c) 2010 Doug Petkanics

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
