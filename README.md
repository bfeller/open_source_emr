# Open Source Electronic Medical Record Software

To use this template you must have experience with Ruby on Rails. I attempted to try and keep everything done the "rails way" as possible to create the lowest barrier of entry for new developers. If you are not familiar with Ruby on Rails, I would recommend you start with the [Rails Guides](http://guides.rubyonrails.org/).

The only thing you should need to do to get started is to run the following commands (if you already have a ruby environment setup):

    bundle install
    rake db:create
    rake db:migrate
    rake db:seed
    rails s


Generally the system is not using Hotwire to its full potential. Maybe in the future.


A few notes about the stack (that are not Rails standard):

* DB is Postgres

* Haml instead of erb

* Sass instead of css or scss

* Bootstrap 5 for templating

* Devise for authentication

* FontAwesome for icons


Things you will want to change before using in production:

* Mailer setup (the mailer is not setup at all and will not work)

* Encryption (Client information should be encrypted and is not setup by default for obvious reasons)


