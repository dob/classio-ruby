classio-ruby -- a ruby wrapper around the classio open classifieds api.
=======================================================================

(note that this README is an attempt at documentation before coding,
and until gem version 1.0 is released all the functionality below
isn't necessarily supported or tested yet.)

## DESCRIPTION ##

classio-ruby is a ruby wrapper built on top of the classio open
classifieds api. 

It is bi-directional in that it lets you easily push your classified
listings into classio, and it also lets you retrieve listings from
classio using various search criteria.


## INSTALLATION ##

Install classio-ruby using RubyGems. The gem is hosted on
rubygems.org, so ensure that is in your gem sources.

    $ sudo gem install classio-ruby


## USAGE ##

Insert your listings into classio

    classio = Classio::API.new(api_key)
    listing = Classio::Listing.new(:title => "2BR in Chelsea Overlooking the Hudson",
                                                   :description => "Love this place",
                                                   :category_id => '1',  # housing,
                                                   :region_id => '1', # New York
                                                   :url => "http://jumppost.com/apartments/23",
                                                   :source => "jumppost.com",
                                                   :expiration_date => "2010 11-01",
                                                   :for_sale => true,
                                                   :price => 3000)
    classio.insert_listing(listing)
    
Search listings from classio

    classio = Classio::API.new(api_key)
    
    # Get the latest housing listings in New York
    listings = classio.get_listings(:region_id => '1',
                                                    :category_id => '1',
                                                    :price => 2000..4000)


## LISTING FIELDS ##

You can pass the following fields into a listing that you create. See
the official documentation for a list of all valid values. **Bold**
fields are required.

* **title** - the title of your classified post
* **category_id** - See the documentation for a list of categories
* *region_id* - See the documentation for a list of regions
* *description* - The body of your classified post
* *price* - The price of the item
* *poster_contact* - An email address to contact the poster of the
   listing
* *url* - A link back to the original listing in your platform
* *source* - The name of your site (so that we can say "this listing
   published from yoursite.com")
* *expiration_date* - The date that you want this listing removed from
   classio in "YYYY MM-DD" format
* *for_sale* - true if this item is for sale, false if not
* *address1* - All the below address fields will be used to pinpoint
   the location of the listing on a map
* *address2*
* *city*
* *state*
* *zip*
* *country*
* *lat*
* *long*
* *image_url[]*  - URL's of images associated with the listing. Only
   the URLs will be passed around so it is up to the implementing site
   how to display the images
   
   
## SEARCH PARAMETERS ##

The following search parameters can be passed into the classio search
query. See the official documentation for all available values.

* *region_id* - Region to search
* *category_id* - Category to search
* *posted_date* - Date range of when the listings were posted
* *per_page* - max number of responses you want per request. Max is
   99.
* *page* - page offset in response. Default is page 1
* *min_id* - Don't return any listings with classio_id less than this
   number. You can use this value to ensure that you only pull new
   results, and not results you've already pulled in with a previous request.


## LICENSE ##

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
