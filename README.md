# Viewing Party Lite

## Description

[Viewing Party Lite](https://backend.turing.edu/module3/projects/viewing_party_lite) is a web application that allows users to create a movie night event with their friends by choosing a movie from The Movie Database (TMDb) and creating a list of attendees. The app also allows users to see movie recommendations based on their search history and add friends to their list of attendees.

This project is built using Ruby on Rails and follows MVC architecture. The database is implemented using PostgreSQL and the front-end is built using HTML, CSS, and Bootstrap. The app also utilizes APIs from The Movie Database (TMDb) to fetch movie data and user authentication is implemented using Devise gem.

## Features

- Search movies by title, cast, or director
- View movie details such as synopsis, rating, and release date
- Create movie viewing events with a list of attendees
- Add friends to attendee list

## Getting Started

To view the current deployed version of this app, [click here](https://viewingparty.herokuapp.com/)

To run this app on your local machine, follow these steps:

1. Clone the repository
2. Install dependencies: `bundle install`
3. Create and migrate the database: `rails db:create && rails db:migrate`
4. Create `.env` file and add your TMDb API key as `TMDB_API_KEY`
5. Start the server: `rails s`

## Dependencies

- Ruby 3.1.1
- Rails 7.0.4
- PostgreSQL 12.7

## API Reference

This app utilizes the following APIs:

- The Movie Database (TMDb) API: https://developers.themoviedb.org/3/getting-started/introduction

## Contributors

This project was created by [Conner Van Loan](https://github.com/C-V-L) and [Harrison Ryan](https://github.com/hwryan12), as part of the [Bootcamp Name] at [School Name]. 

## Acknowledgements

We would like to thank our instructors and peers for their support and guidance throughout the development of this project.
