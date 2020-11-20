# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
create user table:
rails g model User nickname:string mail:string name:string sex:integer age:integer image:string password:string
create post table:
rails g model Post content:text type:integer image:string user:references
create comment table:
rails g model Comment content:text post:references user:references
create notification table:
rails g model Notification post:references state:integer type:integer
create like table:
rails g model Like user:references post:references

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
