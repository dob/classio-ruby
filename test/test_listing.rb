require 'test/unit'
require 'classio'

class ListingTest < Test::Unit::TestCase
  def test_listing_constructor
    listing = basic_listing
    assert_equal listing.price, 234.4
    assert_equal listing.title, "My new house"
  end

  def test_listing_constructor_bad_param
    listing = Classio::Listing.new(listing_params.merge(:blah => "Blab"))
    assert_raise NoMethodError do
      listing.blah
    end
  end

  def test_to_param_string_hash
    listing = basic_listing
    hash = listing.to_param_string_hash
    assert hash.has_key?("title") == true
    assert hash.has_key?(:title) == false
    assert_equal hash["title"], "My new house"
    assert_equal hash["price"], "234.4"
    assert_equal hash["region_id"], "1"
    assert_equal hash["image_urls[]"], ["url1", "url2"]
  end

private

  def listing_params
    {
      :title => "My new house",
      :description => "Great place on the UES",
      :category_id => 1,
      :region_id => 1,
      :price => 234.4,
      :image_urls => ["url1", "url2"]
    }
  end

  def basic_listing
    @listing ||= Classio::Listing.new(listing_params)
  end
end
