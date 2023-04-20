# Open Source Electronic Medical Record Software

Not for commercial use. This is a template for a medical record system. It is not a complete system and is not intended to be used in production. This is a template for you to use to build your own system.

To use this template you must have experience with Ruby on Rails. I attempted to try and keep everything done the "rails way" as possible to create the lowest barrier of entry for new developers. If you are not familiar with Ruby on Rails, I would recommend you start with the [Rails Guides](http://guides.rubyonrails.org/).

## Information

I'm not a doctor, or a medical professional. I do make software for the medical field and I thought I'd put something nice together with my experience. Contributing to the open source community is important and I hope this helps someone.

Also, don't go trying to use this for your own practice out of the box. This is a template and you will need to customize it to your needs. I'm not responsible for any issues you may have with this software.

There is also tables for adding pharamcies to patients if you want to implement some sort of integration with a pharmacy.

## Getting Started

The only thing you should need to do to get started is to run the following commands (if you already have postgres and a ruby environment setup https://cloud.google.com/ruby/docs/setup):

    bundle install
    rake db:create
    rake db:migrate
    rake db:seed
    rails s



## Seed User

The application is initaized with a seed admin user.
u: user@changeme.com
p: 12345678


## Future Updates

Generally the system is not using Hotwire to its full potential. Maybe in the future.

Integration with ICD-11 would be nice as well, right now diagnoses are just text fields.

Tie prescriptions with drug listings, dosages, and other information for the printout.


## A few notes about the stack (that are not Rails standard):

* DB is Postgres

* Haml instead of erb

* Sass instead of css or scss

* Bootstrap 5 for templating

* Devise for authentication

* FontAwesome for icons

## Some handy helpers for you:

* add 'select2' class to a select tag to make it a searchable dropdown

* to make a nicely formatted date field, use the following:

  `= dateify(your_date_field)`

* scaffold commands will automatically generate styling as you see it in the rest of the application.

* I've also added ['chartkick'](https://chartkick.com/) for making pretty charts. Check out the documentation for more information.

## Things you will want to change before using in production:

* Mailer setup (the mailer is not setup at all and will not work)

* Encryption (Client information should be encrypted and is not setup by default for obvious reasons)

* Seed user (The seed user is not setup for production and should be removed)

* Replace 'logo.png' in the assets/images folder with your own logo

* If you need document/file storage, you will need to set that up as well. I recommend using AWS S3. Check out the documentation for ActiveStorage for more information.

* I have not built any reports, every business operates differently and you would just change them anyway. So don't forget to set those up for your use case.

* add legal pages (privacy policy, terms of service, etc)

* Set server timezone to your timezone.

* I have code in the application for deployment with cloud66, but you will need to change the deployment settings to your own.

## Acknowledgements

I used the templates made by [pro-dev-ph](https://github.com/pro-dev-ph/bootstrap-simple-admin-template) for the styling, although pretty heavily modified in some cases so I would use elements from within this software instead of referencing that. 
