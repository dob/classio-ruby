# inspired by the oodle-api-ruby project on github

require 'net/http'
require 'cgi'

module Classio

  INSERT_URL = "http://classio.heroku.com/listings/insert_listing.xml"

  class API
    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    # Insert a Classio::Listing object into classio
    def insert_listing(listing)
      res = post_to_insert_url(listing)
      res
    end

private
    def post_to_insert_url(listing)
      res = Net::HTTP.post_form(URI.parse(INSERT_URL), listing.to_param_string_hash)
      res.body
    end

  end

end
