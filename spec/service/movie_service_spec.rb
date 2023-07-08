require "rails_helper"

RSpec.describe MovieService do
  before(:each) do
    @service = MovieService.new
    @movie_details = @service.search_movies("The Dark Knight")
    @movie_id = @movie_details[:results].first[:id]
  end

  describe "class methods" do
    describe "#top_rated" do
      it "lists the top rated movies", :vcr do
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
      it "allows a user to search for a movie by name", :vcr do
        data = @service.search_movies("The Dark Knight")

        expect(data).to be_a(Hash)
        expect(data[:results]).to be_an(Array)

        movie_data = data[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)
        expect(movie_data[:title]).to eq("The Dark Knight")

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float || Integer)
      end
    end

    describe "#movie_details(id)" do
      it "gives details on a specific movie", :vcr do
        data = @service.movie_details(@movie_id)

        expect(data).to be_a(Hash)

        expect(data).to have_key :title
        expect(data[:title]).to eq("The Dark Knight")

        expect(data).to have_key :vote_average
        expect(data[:vote_average]).to be_a(Float || Integer)

        expect(data).to have_key :runtime
        expect(data[:runtime]).to be_a(Integer)

        expect(data).to have_key :genres
        expect(data[:genres]).to be_an(Array)

        expect(data).to have_key :overview
        expect(data[:overview]).to be_a(String)
      end
    end

    describe "#movie_cast(id)" do
      it "lists cast members of a movie", :vcr do
        data = @service.movie_cast(@movie_id)

        expect(data).to be_a(Hash)
        expect(data[:cast]).to be_an(Array)

        expect(data[:cast].first).to have_key :name
        expect(data[:cast].first[:name]).to be_a(String)

        expect(data[:cast].first).to have_key :character
        expect(data[:cast].first[:character]).to be_a(String)

        expect(data[:cast].second).to have_key :name
        expect(data[:cast].second[:name]).to be_a(String)

        expect(data[:cast].second).to have_key :character
        expect(data[:cast].second[:character]).to be_a(String)
      end
    end

    describe "#movie_reviews(id)" do
      it "lists reviews of a movie", :vcr do
        data = @service.movie_reviews(@movie_id)

        expect(data).to be_a(Hash)
        expect(data[:results]).to be_an(Array)
        expect(data[:results].count).to be >= 0

        expect(data[:results].first).to have_key :author
        expect(data[:results].first[:author]).to be_a(String)

        expect(data[:results].first).to have_key :content
        expect(data[:results].first[:content]).to be_a(String)
      end
    end
  end
end