### Url Shortener

##### 1. Introduction

This project stores original urls in Redis, and redirects the user to the oringal url from http://localhost:3000/:hash

##### 2. Setup

Make sure you have redis installed:

    brew install redis

Run the specs:

    rspec spec

Run cucumber scenarios:

    cucumber

Run the server:

    rails s

And visit http://localhost:3000
