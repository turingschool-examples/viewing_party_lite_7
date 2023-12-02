require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    data = {
      original_title: "The Movie Movie",
      vote_average: 9.23,
      runtime: 200,
      genres: "Drama",
      overview: "Nothing, just nothing",
      backdrop_path: "/a_path"
    }

    movie = Movie.new(data)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Movie Movie")
    expect(movie.vote_average).to eq(9.2)
    expect(movie.instance_variable_get(:@runtime)).to eq(200)
    expect(movie.instance_variable_get(:@genres)).to eq("Drama")
    expect(movie.summary).to eq("Nothing, just nothing")
    expect(movie.image).to eq("/a_path")
  end

  describe "instance methods" do
    before(:each) do
      data = {
        original_title: "The Movie Movie",
        vote_average: 9.23,
        runtime: 90,
        genres: [
          {
            "id": 18,
            "name": "Drama"
          },
          {
            "id": 80,
            "name": "Crime"
          }
        ],
        overview: "Nothing, just nothing"
      }
  
      @movie = Movie.new(data)
    end
    
    it "#convert_runtime" do
      expect(@movie.convert_runtime).to eq("1:30")
    end

    it "#all_genres" do
      expect(@movie.all_genres).to eq("Drama, Crime")
    end

    it "#actor_details, when cast is present" do
      data = {
        original_title: "The Movie Movie",
        vote_average: 9.23,
        runtime: 90,
        genres: [
          {
            "id": 18,
            "name": "Drama"
          },
          {
            "id": 80,
            "name": "Crime"
          }
        ],
        overview: "Nothing, just nothing",
        cast: [
          { 
            "adult": false,
            "gender": 2,
            "id": 3084,
            "known_for_department": "Acting",
            "name": "Marlon Brando",
            "original_name": "Marlon Brando",
            "popularity": 15.475,
            "profile_path": "/fuTEPMsBtV1zE98ujPONbKiYDc2.jpg",
            "cast_id": 146,
            "character": "Don Vito Corleone",
            "credit_id": "6489aa85e2726001072483a9",
            "order": 0 
          },
          { 
            "adult": false,
            "gender": 2,
            "id": 1158,
            "known_for_department": "Acting",
            "name": "Al Pacino",
            "original_name": "Al Pacino",
            "popularity": 41.986,
            "profile_path": "/2dGBb1fOcNdZjtQToVPFxXjm4ke.jpg",
            "cast_id": 147,
            "character": "Michael Corleone",
            "credit_id": "6489aa936f8d9500afdf219c",
            "order": 1 
          }
        ]
      }

      movie = Movie.new(data)
      expected_results = [
          { actor: "Marlon Brando", character: "Don Vito Corleone" },
          { actor: "Al Pacino", character: "Michael Corleone" }
        ]
      
      # expect(@movie.actor_details(data)).to eq(expected_results)
      expect(movie.instance_variable_get(:@cast)).to eq(expected_results)
    end

    it "#actor_details, when cast is not present" do
      data = {
        original_title: "The Movie Movie",
        vote_average: 9.23,
        runtime: 90,
        genres: [
          {
            "id": 18,
            "name": "Drama"
          },
          {
            "id": 80,
            "name": "Crime"
          }
        ],
        overview: "Nothing, just nothing"
      }

      movie = Movie.new(data)

      expect(movie.instance_variable_get(:@cast)).to eq(nil)
    end

    it '#all_cast' do
      data = {
        original_title: "The Movie Movie",
        vote_average: 9.23,
        runtime: 90,
        genres: [
          {
            "id": 18,
            "name": "Drama"
          },
          {
            "id": 80,
            "name": "Crime"
          }
        ],
        overview: "Nothing, just nothing",
        cast: [
          { 
            "adult": false,
            "gender": 2,
            "id": 3084,
            "known_for_department": "Acting",
            "name": "Marlon Brando",
            "original_name": "Marlon Brando",
            "popularity": 15.475,
            "profile_path": "/fuTEPMsBtV1zE98ujPONbKiYDc2.jpg",
            "cast_id": 146,
            "character": "Don Vito Corleone",
            "credit_id": "6489aa85e2726001072483a9",
            "order": 0 
          },
          { 
            "adult": false,
            "gender": 2,
            "id": 1158,
            "known_for_department": "Acting",
            "name": "Al Pacino",
            "original_name": "Al Pacino",
            "popularity": 41.986,
            "profile_path": "/2dGBb1fOcNdZjtQToVPFxXjm4ke.jpg",
            "cast_id": 147,
            "character": "Michael Corleone",
            "credit_id": "6489aa936f8d9500afdf219c",
            "order": 1 
          }
        ]
      }

      movie = Movie.new(data)

      expected_result = [
        'Don Vito Corleone Played by: Marlon Brando',
        'Michael Corleone Played by: Al Pacino'
      ]

      expect(movie.all_cast).to eq(expected_result)
    end

    it '#review_details, when reviews are present' do
      data = {
        original_title: "The Movie Movie",
        vote_average: 9.23,
        runtime: 90,
        genres: [
          {
            "id": 18,
            "name": "Drama"
          },
          {
            "id": 80,
            "name": "Crime"
          }
        ],
        overview: "Nothing, just nothing",
        results: [
          {
            "author": "Suresh Chidurala",
            "author_details": {
              "name": "Suresh Chidurala",
              "username": "Suresh17511",
              "avatar_path": "/sh7cCmcnHx3kg2NlSgSK0dLDSKn.jpg",
              "rating": 9
            },
            "content": "Great Movie **Ever**",
            "created_at": "2023-06-11T09:30:35.855Z",
            "id": "6485943be375c000c5282981",
            "updated_at": "2023-06-13T15:48:33.210Z",
            "url": "https://www.themoviedb.org/review/6485943be375c000c5282981"
          }
        ]
      }

      movie = Movie.new(data)

      expected_result = [
        { author: "Suresh Chidurala", content: "Great Movie **Ever**" },
      ]

      expect(movie.instance_variable_get(:@reviews)).to eq(expected_result)
    end
  end
end