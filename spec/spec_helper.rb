ENV["RACK_ENV"] = "test"

require "rspec"
require "pg"
require "pry"
require "shoulda-matchers"
require "sinatra/activerecord"
require "shoe-store"

RSpec.configure do |config|
  config.after(:each) do
    Brand.all.each do |recipe|
      recipe.destroy
    end

    Store.all.each do |category|
      category.destroy
    end

  end
end
