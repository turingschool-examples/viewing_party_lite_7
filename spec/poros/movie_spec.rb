require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    data = {
      original_title: "The Movie Movie",
      vote_average: 9.23,
      runtime: 200,
      genres: "Drama",
      overview: "Nothing, just nothing"
    }

    movie = Movie.new(data)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Movie Movie")
    expect(movie.vote_average).to eq(9.2)
    expect(movie.instance_variable_get(:@runtime)).to eq(200)
    expect(movie.instance_variable_get(:@genres)).to eq("Drama")
    expect(movie.summary).to eq("Nothing, just nothing")
  end

  describe "instance methods" do
    before(:each) do
      data = {
        original_title: "The Movie Movie",
        vote_average: 9.23,
        runtime: 90,
        genres:
        [
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
  end
end