require "capybara/rspec"
require "./app"
require "spec_helper"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# Store pathway
describe("the store creation path", {:type => :feature}) do
  it("creates a new Store") do
    visit("/")
    click_link("Stores")
    fill_in("store-name", :with => "adidas")
    click_button("Add New Store")
    expect(page).to have_content("Adidas")
  end
end

# describe("the store creation path", {:type => :feature}) do
#   it("creates a new Store") do
#     visit("/")
#     click_link("Stores")
#     fill_in("store-name", :with => "adidas")
#     click_button("Add New Store")
#     expect(page).to have_content("Adidas")
#   end
# end

# brand Path way
describe("the brand creation path", {:type => :feature}) do
  it("creates a new brand") do
    visit("/")
    click_link("Shoe Brands")
    fill_in("brand-name", :with => "nike")
    fill_in("brand-price", :with => "65")
    click_button("Add New Brand")
    expect(page).to have_content("Nike")
  end
end

describe("the brand update path", {:type => :feature}) do
  it("looks at and update brand") do
    visit("/brands")
    fill_in("brand-name", :with => "nike")
    fill_in("brand-price", :with => "65")
    click_button("Add New Brand")
    click_link("Nike")
    fill_in("brand-name", :with => "nike outlet")
    fill_in("brand-price", :with => "45")
    click_button("Update")
    expect(page).to have_content("Nike Outlet")
  end
end
