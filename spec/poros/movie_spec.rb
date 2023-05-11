require 'rails_helper'

RSpec.describe Movie do
  describe "#initialize" do
    let(:data) do
      {
        title: "The Shawshank Redemption",
        vote_average: 9.3,
        id: 278,
        runtime: 142,
        genres: ["Drama", "Crime"],
        overview: "Two imprisoned men bond over a number of years...",
        poster_path: "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg"
      }
    end
    
    it "exists" do
        movie = Movie.new(data)
        expect(movie.title).to eq(data[:title])
        expect(movie.vote_average).to eq(data[:vote_average])
        expect(movie.id).to eq(data[:id])
        expect(movie.runtime).to eq(data[:runtime])
        expect(movie.genres).to eq(data[:genres])
        expect(movie.summary).to eq(data[:overview])
        expect(movie.instance_variable_get(:@poster)).to eq(data[:poster_path])
    end

  end
end