require 'rails_helper'

RSpec.describe Movie do
  it "exists w/ attrs", :vcr do
    attrs = {
      :adult=>false,
      :backdrop_path=>"/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
      :genre_ids=>[18, 80],
      :id=>238,
      :original_language=>"en",
      :original_title=>"The Godfather",
      :overview=>
      "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
      :popularity=>118.008,
      :poster_path=>"/3bhkrj58Vtu7enYsRolD1fZdja1.jpg", #we need to have this on the discover page 
      :release_date=>"1972-03-14",
      :title=>"The Godfather",
      :video=>false,
      :vote_average=>8.7,
      :vote_count=>18470
    }
  
    movie = Movie.new(attrs)

    overview = "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge."

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Godfather")    
    expect(movie.vote_average).to eq(8.7)
    expect(movie.summary).to eq(overview)
  end

  it "can create a genre array", :vcr do 

    genres = {
        "genres": [
            {
                "id": 18,
                "name": "Drama"
            },
            {
                "id": 80,
                "name": "Crime"
            }
        ]
    }

    movie = Movie.new(genres)

    expect(movie.genres).to eq(["Drama", "Crime"])
    expect(movie.genres).to_not eq("Crime")
    expect(movie.genres).to_not eq("Drama")
  end

  it "can calculate a runtime", :vcr do 
    runtime = {
      "release_date": "1972-03-14",
      "revenue": 245066411,
      "runtime": 175
    }

    movie = Movie.new(runtime)

    expect(movie.runtime).to eq("2:55")
  end

  it "can create a cast and character array limited to the first 10 members", :vcr do
    twelve_cast_and_characters = {
      "credits": {
        "cast": [
            {
                "name": "Marlon Brando",
                "original_name": "Marlon Brando",
                "character": "Don Vito Corleone",
            },
            {
                "name": "Al Pacino",
                "original_name": "Al Pacino",
                "character": "Michael Corleone",
            },
            {
                "name": "James Caan",
                "original_name": "James Caan",
                "character": "Sonny Corleone",
            },
            {
                "name": "Robert Duvall",
                "original_name": "Robert Duvall",
                "character": "Tom Hagen",
            },
            {
                "name": "Richard S. Castellano",
                "original_name": "Richard S. Castellano",
                "character": "Clemenza",
            },
            {
                "name": "Diane Keaton",
                "original_name": "Diane Keaton",
                "character": "Kay Adams",
            },
            {
                "name": "Talia Shire",
                "original_name": "Talia Shire",
                "character": "Connie Corleone Rizzi",
            },
            {
                "name": "Gianni Russo",
                "original_name": "Gianni Russo",
                "character": "Carlo Rizzi",
            },
            {
                "name": "Sterling Hayden",
                "original_name": "Sterling Hayden",
                "character": "Captain McCluskey",
            },
            {
                "name": "John Marley",
                "original_name": "John Marley",
                "character": "Jack Woltz",
            },   
            {
              "name": "Richard Conte",
              "original_name": "Richard Conte",
              "character": "Barzini",
            },
            {
                "name": "Al Lettieri",
                "original_name": "Al Lettieri",
                "character": "Sollozzo",
            } 
          ]
        } 
      }

    movie = Movie.new(twelve_cast_and_characters)

    expect(movie.cast).to eq(["Marlon Brando, as Don Vito Corleone", "Al Pacino, as Michael Corleone", "James Caan, as Sonny Corleone", "Robert Duvall, as Tom Hagen", "Richard S. Castellano, as Clemenza", "Diane Keaton, as Kay Adams", "Talia Shire, as Connie Corleone Rizzi", "Gianni Russo, as Carlo Rizzi", "Sterling Hayden, as Captain McCluskey", "John Marley, as Jack Woltz"])
    expect(movie.cast).to_not eq(["Marlon Brando, as Don Vito Corleone", "Al Pacino, as Michael Corleone", "James Caan, as Sonny Corleone", "Robert Duvall, as Tom Hagen", "Richard S. Castellano, as Clemenza", "Diane Keaton, as Kay Adams", "Talia Shire, as Connie Corleone Rizzi", "Gianni Russo, as Carlo Rizzi", "Sterling Hayden, as Captain McCluskey", "John Marley, as Jack Woltz", "Richard Conte, as Barzini", "Al Lettieri, as Sollozzo"])
  end

  xit "can return the total number of reviews", :vcr do 
    review_info = {
      "total_pages": 1,
      "total_results": 5
  }

    movie = Movie.new(review_info)

    expect(movie.review_count).to eq(5)
  end

  xit "can create an array of reviews with author attributes", :vcr do 
    review_info = {
      "id": 238,
      "page": 1,
      "results": [
          {
              "author": "futuretv",
              "author_details": {
                  "name": "",
                  "username": "futuretv",
                  "rating": 10.0
              },
          },
          {
              "author": "crastana",
              "author_details": {
                  "name": "",
                  "username": "crastana",
                  "rating": 10.0
              },
          },
          {
              "author": "drystyx",
              "author_details": {
                  "name": "",
                  "username": "drystyx",
                  "avatar_path": "/hLLsAvAnVT0cFU7JuuaaItTWXv8.jpg",
                  "rating": 1.0
              },
          },
          {
              "author": "CinemaSerf",
              "author_details": {
                  "name": "CinemaSerf",
                  "username": "Geronimo1967",
                  "avatar_path": "/1kks3YnVkpyQxzw36CObFPvhL5f.jpg",
                  "rating": 7.0
              },
          },
          {
              "author": "Suresh Chidurala",
              "author_details": {
                  "name": "Suresh Chidurala",
                  "username": "Suresh17511",
                  "rating": 9.0
              },
          }
      ],
      "total_pages": 1,
      "total_results": 5
  }
  
  movie = Movie.new(review_info)

  expect(movie.reviews).to eq[{:author=>"futuretv", :name=>"", :username=>"futuretv", :rating=>10.0},
    {:author=>"crastana", :name=>"", :username=>"crastana", :rating=>10.0},
    {:author=>"drystyx", :name=>"", :username=>"drystyx", :rating=>1.0},
    {:author=>"CinemaSerf", :name=>"CinemaSerf", :username=>"Geronimo1967", :rating=>7.0},
    {:author=>"Suresh Chidurala", :name=>"Suresh Chidurala", :username=>"Suresh17511", :rating=>9.0}]

  end
end