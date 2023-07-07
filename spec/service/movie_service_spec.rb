require "rails_helper"

RSpec.describe MovieService do
  before(:each) do
    @service = MovieService.new
    @movie_details = @service.search_movies("Forrest Gump")
    @movie_id = @movie_details[:results].first[:id]
  end

  describe "class methods", :vcr do
    describe "#top_rated" do
      it "lists the top rated movies" do
        data = @service.top_rated

        expect(data).to be_a(Hash)
        expect(data[:results]).to be_an(Array)
        expect(data[:results].count).to eq(20)

        movie_data = data[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float || Integer)
      end
    end

    describe "#search_movies" do
      it "allows a user to search for a movie by name" do
        data = @service.search_movies("Forrest Gump")

        expect(data).to be_a(Hash)
        expect(data[:results]).to be_an(Array)

        movie_data = data[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)
        expect(movie_data[:title]).to eq("Forrest Gump")

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float || Integer)
      end
    end

    describe "#movie_details(id)" do
      it "gives details on a specific movie" do
        data = @service.movie_details(@movie_id)

        expect(data).to be_a(Hash)

        expect(data).to have_key :title
        expect(data[:title]).to eq("Forrest Gump")

        expect(data[:vote_average]).to be_a(Float || Integer)

        expect(data[:runtime]).to be_a(Integer)

        expect(data[:genres]).to be_an(Array)

        expect(data[:overview]).to be_a(String)
        
        require 'pry'; binding.pry
      end
    end

    # describe "#movie_cast(id)" do

    # end
  end
end