# inspired by the oodle-api-ruby project on github

require 'net/http'
require 'cgi'
#require 'xmlsimple'

module Classio

  INSERT_URL = "http://classio.heroku.com/listings/insert_listing.xml"

  class API
    attr_accessor :api_key, :title, :description, :category_id, :poster_contact, :url, :source, :expiration_date, :for_sale, :price, :region_id, :address1, :address2, :city, :state, :country, :zip, :lat, :long, :image_url

    def initialize(api_key)
      @api_key = api_key
    end

    def make_request(url)
      res = Net::HTTP.get_response(URI.parse(url))
      res.body
    end

    def setup_url
      url = INSERT_URL + "?"
      
      url = "#{url}api_key=#{CGI::escape(self.api_key)}"
      url = "#{url}&title=#{CGI::escape(self.title)}" if self.title
      url = "#{url}&description=#{CGI::escape(self.description)}" if self.description
      url = "#{url}&category_id=#{CGI::escape(self.category_id)}" if self.category_id
      url = "#{url}&poster_contact=#{CGI::escape(self.poster_contact)}" if self.poster_contact
      url = "#{url}&url=#{CGI::escape(self.url)}" if self.url
      url = "#{url}&source=#{CGI::escape(self.source)}" if self.source
      url = "#{url}&expiration_date=#{CGI::escape(self.expiration_date)}" if self.expiration_date
      url = "#{url}&for_sale=#{CGI::escape(self.for_sale)}" if self.for_sale
      url = "#{url}&price=#{CGI::escape(self.price)}" if self.price
      url = "#{url}&region_id=#{CGI::escape(self.region_id)}" if self.region_id
      url = "#{url}&address1=#{CGI::escape(self.address1)}" if self.address1
      url = "#{url}&address2=#{CGI::escape(self.address2)}" if self.address2
      url = "#{url}&city=#{CGI::escape(self.city)}" if self.city
      url = "#{url}&state=#{CGI::escape(self.state)}" if self.state
      url = "#{url}&zip=#{CGI::escape(self.zip)}" if self.zip
      url = "#{url}&country=#{CGI::escape(self.country)}" if self.country
      url = "#{url}&lat=#{CGI::escape(self.lat)}" if self.lat
      url = "#{url}&long=#{CGI::escape(self.long)}" if self.long
      url = "#{url}&image_url=#{CGI::escape(self.image_url)}" if self.image_url
      url
    end
    
    def get_result
      make_request(setup_url)
    end
    
    def insert_listing
      res = get_result
      res
      #result = XmlSimple.xml_in res, { 'ForceArray' => false, 'AttrPrefix' => true }
      #result
    end

  end

end
