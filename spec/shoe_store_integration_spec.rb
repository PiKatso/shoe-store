require "capybara/rspec"
require "./app"
require "spec_helper"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the store creation path", {:type => :feature}) do
  it("creates a new Store") do
    visit("/")
    click_link("Stores")
    fill_in("store-name", :with => "adidas")
    click_button("Add New Store")
    expect(page).to have_content("Adidas")
  end
end
