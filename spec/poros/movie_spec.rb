require 'rails_helper'

RSpec.describe Movie do
  before(:each) do
    @data = {
      "adult": false,
      "backdrop_path": "/oMsxZEvz9a708d49b6UdZK1KAo5.jpg",
      "belongs_to_collection": {
          "id": 2344,
          "name": "The Matrix Collection",
          "poster_path": "/bV9qTVHTVf0gkW0j7p7M0ILD4pG.jpg",
          "backdrop_path": "/bRm2DEgUiYciDw3myHuYFInD7la.jpg"
      },
      "budget": 63000000,
      "genres": [
          {
              "id": 28,
              "name": "Action"
          },
          {
              "id": 878,
              "name": "Science Fiction"
          }
      ],
      "homepage": "http://www.warnerbros.com/matrix",
      "id": 603,
      "imdb_id": "tt0133093",
      "original_language": "en",
      "original_title": "The Matrix",
      "overview": "Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.",
      "popularity": 63.435,
      "poster_path": "/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
      "production_companies": [
          {
              "id": 79,
              "logo_path": "/tpFpsqbleCzEE2p5EgvUq6ozfCA.png",
              "name": "Village Roadshow Pictures",
              "origin_country": "US"
          },
          {
              "id": 372,
              "logo_path": "/xlvoOZr4s1PygosrwZyolIFe5xs.png",
              "name": "Groucho II Film Partnership",
              "origin_country": ""
          },
          {
              "id": 1885,
              "logo_path": "/xlvoOZr4s1PygosrwZyolIFe5xs.png",
              "name": "Silver Pictures",
              "origin_country": "US"
          },
          {
              "id": 174,
              "logo_path": "/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
              "name": "Warner Bros. Pictures",
              "origin_country": "US"
          }
      ],
      "production_countries": [
          {
              "iso_3166_1": "US",
              "name": "United States of America"
          }
      ],
      "release_date": "1999-03-30",
      "revenue": 463517383,
      "runtime": 136,
      "spoken_languages": [
          {
              "english_name": "English",
              "iso_639_1": "en",
              "name": "English"
          }
      ],
      "status": "Released",
      "tagline": "Welcome to the Real World.",
      "title": "The Matrix",
      "video": false,
      "vote_average": 8.2,
      "vote_count": 23405
    }

    @movie = Movie.new(@data)
  end

  it 'exists' do
    expect(@movie).to be_a(Movie)
  end

  it 'has attributes' do
    expect(@movie.id).to eq(603)
    expect(@movie.title).to eq('The Matrix')
    expect(@movie.vote_average).to eq(8.2)
    expect(@movie.num_reviews).to eq(23405)
    expect(@movie.runtime).to eq('2h 16m')
    expect(@movie.summary).to eq('Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.')
    expect(@movie.poster_path).to eq('/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg')
    expect(@movie.genres).to eq(['Action', 'Science Fiction'])
  end

  it 'can convert the genre info nested hash to an array of genre names' do
    expect(@data[:genres]).to be_an(Array)
    expect(@data[:genres]).to eq([{:id=>28, :name=>"Action"}, {:id=>878, :name=>"Science Fiction"}])
    expect(@movie.genre_names(@data[:genres])).to eq(['Action', 'Science Fiction'])
    expect(@movie.genres).to eq(['Action', 'Science Fiction'])
  end

  it 'can convert the runtime from minutes (int) to hours and minutes (string)' do
    expect(@data[:runtime]).to eq(136)
    expect(@movie.convert_time(@data[:runtime])).to eq('2h 16m')
    expect(@movie.runtime).to eq('2h 16m')
  end
end
