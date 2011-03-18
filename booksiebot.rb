require 'sinatra'
require 'rack-flash'

class Booksiebot < Sinatra::Base
# fred was here.
  set :haml, { :format => :html5 }
  enable :sessions
  use Rack::Flash

  get '/' do
    @requests = BookRequest.all
    haml :index
  end
  
  get '/reviews' do
    "Ok"
  end

  post '/book_requests' do
    request = BookRequest.create(params[:book_request])
    if request.save
      flash[:notice] = "Request submitted"
      redirect '/'
    else
      raise "WHOOPS"
    end
  end
end
