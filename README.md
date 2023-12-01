# Viewing Party for 2308
Created by Blaine Kennedy and Allan Evans

This is the base repo for the [Viewing Party Lite project](https://backend.turing.edu/module3/projects/viewing_party_lite) used for Turing's Backend Module 3.

### About this Project

Viewing Party Lite is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application.  It uses the movie database api and several endpoints to pull the information and display it on the view.
Internally the app uses Webmock so that the tests can be run offline using fixtures and the api call is abstracted using facades so the methods can handle single responsibilities (most of the time)
There is an extension for accepting invitations for parties that was almost (or is finished by the time the project is turned in) in branch ext/feat/invite_accept.

## Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install` then `bundle update`
3. Setup the database: `rails db:{create,migrate}`


## Versions

- Ruby 3.2.2

- Rails 7.0.6

Example wireframes to follow are found [here](https://backend.turing.edu/module3/projects/viewing_party_lite/wireframes)
