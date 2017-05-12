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

post "/stores" do
  store_name = params.fetch("store-name")
  Store.create({name: store_name})
  redirect "/stores"
end

get "/store/:id" do
  store_id = params.fetch("id")
  @store = Store.find(store_id)
  erb(:store_edit)
end

post "/store/add-brand" do
  store_id = params.fetch("store_id")
  store = Store.find(store_id)
  brand_name = params.fetch("brand-name")
  brand_price = params.fetch("brand-price")
  new_brand = Brand.create(name: brand_name, price: brand_price)
  store.brands.push(new_brand)
  redirect "/store/#{store_id}"
end

# Brand routing
get('/brands') do
  @brand_message = Brand.all.length > 0 ? "Select a brand to review prices and locations for purchase" : "Add a brand below"
  erb :brand
end

post "/brands" do
  brand_name = params.fetch("brand-name")
  brand_price = params.fetch("brand-price")
  Brand.create({name: brand_name, price: brand_price})
  redirect "/brands"
end

#routed from store
get "/brand/:id" do
  @brand_id = params.fetch("id")
  @brand = Brand.find(@brand_id)
  @stores = Store.all
  erb(:brand_edit)
end

# post "/brands" do
#   store_id = params.fetch("store_id")
#   store = Recipe.find(store_id)
#   ingredient_name = params.fetch("ingredient-name")
#   new_ingredient = Ingredient.create(name: ingredient_name)
#   store.ingredients.push(new_ingredient)  #this how to assign to join table!!!! yay!
#   redirect "/store/edit/#{store_id}"
# end

patch "/brand/:id/update" do
  brand_name = params.fetch("brand-name")
  @brand = Brand.find(params.fetch("id").to_i)
  @brand.update({name: brand_name})
  redirect "/stores"
end

post "/brand/assign-project/:id" do
  store_id = params.fetch('store_id')
  store = Store.find(store_id)
  brand_id = params.fetch('id')
  brand = Brand.find(brand_id)
  store.brands.push(brand)
  redirect "/stores"
end
