Hair Salon App by Taral Gurung

Hair Salon An application for a hair salon. The stylists at the salon work independently, so each client will only belong to a single stylist (one stylist, many clients).

The following are the user stories:

As a salon owner, I want to view, add, update and delete stylists. As a salon owner, I want to view, add, update and delete clients. As a salon owner, I want to add clients to a stylist.

database setup instructions with your database


Installation

Open your bash or terminal. Go the a directory you wanna save the folder.

$ git clone https://github.com/taralgrg/hair-saloon-app.git
$ cd hair-salon-app
$ bundle install

If it encounters a problem. Please make sure you have installed homebrew, git commands, ruby and dependencies, update them.

For Mac users :

echo "gem: --no-document" > ~/.gemrc
gem install bundler
bundle update

In PSQL:

CREATE DATABASE hair_salon;
 CREATE TABLE clients(id serial PRIMARY KEY, name varchar, stylist_id int);
 CREATE TABLE stylists(id serial PRIMARY KEY, name varchar);

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

Usage

$to serve locally (this project is built with ruby 2.2.2) :$ ruby app.rb

If you got a error message in running rspec

Something went wrong while loading app.rb
Gem::ConflictError: Unable to activate sinatra-1.4.7, because rack-2.0.1 conflicts with rack (~> 1.5)

Then uninstall the rack version 2.0.1

$ gem uninstall rack

Select gem to uninstall:
 1. rack-2.0.1
 2. rack-1.6.4
 3. All versions

> $ 1

Successfully uninstalled rack-2.0.1
Solution was found on a Japanese blog. Reference here: (http://mitsuakikawamorita.com/blog/?p=3135)

Contributing

if you find bugs, please send me a "issue" at this repo (https://github.com/1saacWong/hair-salon-app)

or

Fork it!
Create your feature branch: $ git checkout -b my-new-feature
Commit your changes: $ git commit -m "Add some feature"
Push to the branch: $ git push origin my-new-feature
Submit a pull request :D
History

2017 Independent Project on using Ruby and Sinatra

Credits

My coursemates and instructor

License

This is an open source programme. Please include my repository link when using it: (https://github.com/taralgrg/hair-saloon-app.git)
