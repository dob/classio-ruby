require 'test/unit'
require 'classio'

class APITest < Test::Unit::TestCase

  def test_api_constructor
    api = Classio::API.new("mykey")
    assert_not_nil api
  end  

end
