module Classio
  class Listing
    attr_accessor :title, :description, :category_id, :poster_contact, :url, :source, :expiration_date, :for_sale, :price, :region_id, :address1, :address2, :city, :state, :country, :zip, :lat, :long, :image_urls
    
    def initialize(options)
      self.title = options[:title]
      self.description = options[:description]
      self.category_id = options[:category_id].to_i if options[:category_id]
      self.poster_contact = options[:poster_contact]
      self.url = options[:url]
      self.source = options[:source]
      self.expiration_date = Date.parse(options[:expiration_date]) if options[:expiration_date]
      self.for_sale = options[:for_sale] == "true"
      self.price = options[:price].to_f if options[:price]
      self.region_id = options[:region_id].to_i if options[:region_id]
      self.address1 = options[:address1]
      self.address2 = options[:address2]
      self.city = options[:city]
      self.state = options[:state]
      self.country = options[:country]
      self.zip = options[:zip]
      self.lat = options[:lat].to_f if options[:lat]
      self.long = options[:long].to_f if options[:long]
      self.image_urls = options[:image_urls] || []
    end

    # Returns a dictionary with all the attributes as strings
    def to_param_string_hash
      res = {}
      
      # insert all the string properties
      %w[title description category_id poster_contact url
         source expiration_date for_sale price region_id address1 
         address2 city state country zip lat long].each do |att|
        res[att] = (self.send att).send "to_s" if self.respond_to? att
      end

      # need to make sure that Net::HTTP.post_form will pass this correctly
      res["image_urls[]"] = self.image_urls
      res
    end

  end
end
