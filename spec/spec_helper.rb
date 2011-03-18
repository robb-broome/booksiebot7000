require File.join(File.dirname(__FILE__), '..', 'booksiebot.rb')

require 'rack/test'
require 'test/unit'

class Test::Unit::TestCase
  include Rack::Test::Methods
end

# set test environment
set :environment, :test
# set :run, false
# set :raise_errors, true
# set :logging, false
