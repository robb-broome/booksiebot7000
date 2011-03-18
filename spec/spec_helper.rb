require File.join(File.dirname(__FILE__), '..', 'booksiebot.rb')

require 'rack/test'

# don't have to have the include in every spec
RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  #@app ||= Sinatra::Application
  Booksiebot
end

# set test environment
set :environment, :test
# set :run, false
set :raise_errors, true
# set :logging, false
