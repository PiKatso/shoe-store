require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/shoe-store'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

# Store routing
get('/stores') do
  @store_message = Store.all.length > 0 ? "Select a store to review brands carries" : "No stores yet, add a store."
  erb :store
end

# Brand routing
get('/brands') do
  @brand_message = Brand.all.length > 0 ? "Select a brand to review prices and locations for purchase" : "Add a brand below"
  erb :brand
end
