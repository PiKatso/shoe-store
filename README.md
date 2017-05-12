# Epicodus Volunteer Tracker

Application for tracking shoe brands and the stores they are in.

### Setup/Installation Requirements

Installation is quick and easy!

First clone the repository.
Navigate to the repository and open using a text editor
In terminal window, run '$ bundle install'
In a separate terminal window, run '$ psql'.
In 'pSQL' terminal window, run '$ rake db:create'
In a separate terminal window, run '$ruby app.rb'.
In browser, go to 'http://localhost:4567/', (Sinatra standard port 4567).

and enjoy!

## Built With

* Ruby
* Browser: Chrome or Safari
* Sinatra
* Capybara
* ActiveRecord
* HTML
* CSS
* Rspec
* Bootstrap https://getbootstrap.com/
* SQL
* Postgres

## Specifications/user stories

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add and list new shoe brands. Shoe brands should include price.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I want the price to be in currency format even if I just inputted a number. (In other words, typing in 50 should be updated to $50.00.)
* As a user, I do not want stores and/or shoe brands to be saved if I enter a blank name.
* As a user, I want all stores and brands to be unique. There shouldn't be two entries in the database for Blundstone.
* As a user, I want store and brand names to have a maximum of one hundred characters.


## Author

* Kat Gifford

## License

MIT

Copyright © 2017 Kat Gifford
