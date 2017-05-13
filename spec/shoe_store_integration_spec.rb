require "capybara/rspec"
require "./app"
require "spec_helper"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# Store pathway
describe("the store path", {:type => :feature}) do

  it("creates a new Store") do
    visit("/")
    click_link("Stores")
    fill_in("store-name", :with => "adidas")
    click_button("Add New Store")
    expect(page).to have_content("Adidas")
  end

  it("looks at and updates Store") do
    visit("/stores")
    fill_in("store-name", :with => "famous footwear")
    click_button("Add New Store")
    click_link("Famous Footwear")
    fill_in("store-name", :with => "DSW")
    click_button("Update Famous Footwear")
    expect(page).to have_content("Dsw")
  end

end

# Brand path way
describe("the Brand creation path", {:type => :feature}) do

  it("creates a new brand") do
    visit("/")
    click_link("Shoe Brands")
    fill_in("brand-name", :with => "nike")
    fill_in("brand-price", :with => "65")
    click_button("Add New Brand")
    expect(page).to have_content("Nike")
  end

  it("looks at and updates Brand") do
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
