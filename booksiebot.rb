require 'sinatra'
require 'rack-flash'

class Booksiebot < Sinatra::Base
  set :haml, { :format => :html5 }
  enable :sessions
  use Rack::Flash

  get '/review' do
    @review = BookReview.new
    haml :review
  end

  post '/review' do
    puts params[:book_review]
    review = BookReview.create(params[:book_review])
    if review.save
      flash[:notice] = "Review submitted"
      redirect '/reviews'
    else
      raise "Bad review"
    end
  end

  get '/reviews' do
    @reviews = BookReview.all
    haml :reviews
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

  get '/' do
    @requests = BookRequest.all
    haml :index
  end
end
