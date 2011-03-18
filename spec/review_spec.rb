require File.dirname(__FILE__) + '/spec_helper'

describe "Booksiebot" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/reviews'
    last_response.should be_ok
  end

  it "should route properly /" do
    assert_routing '/review', :controller => 'review', :action => 'post'
  end
end
