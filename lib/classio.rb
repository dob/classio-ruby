# inspired by the oodle-api-ruby project on github
module Classio
  VERSION = '0.1.0'

end

directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, 'classio', 'api')
require File.join(directory, 'classio', 'listing')
