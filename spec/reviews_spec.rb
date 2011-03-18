require File.dirname(__FILE__) + '/spec_helper'

describe "Booksiebot" do

  it "should respond to /reviews" do
    get '/reviews'
    last_response.should be_ok
  end

end
