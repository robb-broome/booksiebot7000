require 'sinatra'
require 'sinatra/sequel'

configure :development do
  set :database, 'sqlite://db/booksiebot-development.db'
end

migration "create book_requests table" do
  database.create_table :book_requests do
    primary_key :id
    string      :title
    timestamp   :created_at, :null => false
  end
end

migration "add request fields to book_requests" do
  database.alter_table :book_requests do
    add_column :publisher, :string
    add_column :electronic, :boolean
  end
end

migration "add book_reviews table" do
  database.create_table :book_reviews do
    primary_key :id
    string      :review_title, :limit => 80
    text        :review
  end
end

migration "add book_review timestamp" do
  database.alter_table :book_reviews do
    add_column :created_at, :timestamp
  end
end
