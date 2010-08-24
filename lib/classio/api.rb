# inspired by the oodle-api-ruby project on github

require 'net/http'
require 'json'

module Classio

  INSERT_URL = "http://localhost:3000/listings/insert_listing.xml"

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
      uri = URI.parse(INSERT_URL)

      # Must pass in the params using json and set the content type to application/json.
      # If you don't do this then Rails throws and InvalidAuthenticityToken exception
      # because it assumes you're submiting a form.
      req = Net::HTTP::Post.new(uri.path)
      req.body = JSON.generate(listing.to_param_string_hash.merge(:api_key => self.api_key))
      req["Content-Type"] = "application/json"

      http = Net::HTTP.new(uri.host, uri.port)
      response = http.start {|htt| htt.request(req)}
    end

  end
end
