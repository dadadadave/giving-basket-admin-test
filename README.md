# README

This is my implementation of the backend of the Giving Basket admin interface for sending checks.

There are three routes with corresponding controller actions:
* checks#index
* nonprofits#update
* payments#create

three models:
* Check
* Donation
* Nonprofit

two service objects in the app/services directory:
* CreateCheck
* SendCheck

a Rake task to create checks for new donations:
* rake check:prepare

and a set of seeds in db/seeds.rb.

All models, controllers and service objects are tested using Minitest.  I used the Kaminari gem to paginate the list of checks and Timecop to handle some time-related tests.  The pattern I used for the service objects was inspired by this blog post: https://brewhouse.io/blog/2014/04/30/gourmet-service-objects.html.
