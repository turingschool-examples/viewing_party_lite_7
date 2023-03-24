require "rails_helper"

RSpec.describe MoviesService do
  describe "#class methods" do
    describe "#parse_api" do
      it "returns a json object", :vcr do
        expect(MoviesService.parse_api("/3/movie/top_rated")).to be_a(Hash)
      end
    end

    describe "searched_movies", :vcr do
      it "keyword search" do
        keyword_search = MoviesService.searched_movies("God")
        shazam = keyword_search[:results].first

        expect(keyword_search).to be_a(Hash)

        expect(shazam).to have_key(:id)
        expect(shazam[:id]).to be_a(Integer)

        expect(shazam).to have_key(:title)
        expect(shazam[:title]).to be_a(String)

        expect(shazam).to have_key(:vote_average)
        expect(shazam[:vote_average]).to be_a(Float)
      end
    end

    describe "top_rated_moves" do
      it "top rated movies json" do
        VCR.use_cassette("returns_a_json_object") do
          top_rated_movies = MoviesService.top_rated_movies
          the_godfather = top_rated_movies[:results].first

          expect(top_rated_movies).to be_a(Hash)

          expect(the_godfather).to have_key(:id)
          expect(the_godfather[:id]).to be_a(Integer)

          expect(the_godfather).to have_key(:title)
          expect(the_godfather[:title]).to be_a(String)

          expect(the_godfather).to have_key(:vote_average)
          expect(the_godfather[:vote_average]).to be_a(Float)
        end
      end
    end

    describe "movie_details", :vcr do
      it "movie details" do
        the_godfather = MoviesService.movie_details(238)
        expect(the_godfather).to be_a(Hash)

        expect(the_godfather).to have_key(:id)
        expect(the_godfather[:id]).to be_a(Integer)

        expect(the_godfather).to have_key(:title)
        expect(the_godfather[:title]).to be_a(String)

        expect(the_godfather).to have_key(:vote_average)
        expect(the_godfather[:vote_average]).to be_a(Float)

        expect(the_godfather).to have_key(:runtime)
        expect(the_godfather[:runtime]).to be_a(Integer)

        expect(the_godfather).to have_key(:genres)
        expect(the_godfather[:genres]).to be_a(Array)

        expect(the_godfather).to have_key(:overview)
        expect(the_godfather[:overview]).to be_a(String)
      end
    end

    describe "credits", :vcr do
      it "returns a json objects containing movie credits" do
        credits = MoviesService.credits(238)
        cast_member = credits[:cast].first

        expect(credits).to be_a(Hash)

        expect(cast_member).to have_key(:name)
        expect(cast_member[:name]).to be_a(String)

        expect(cast_member).to have_key(:name)
        expect(cast_member[:name]).to be_a(String)
      end
    end

    describe "reviews", :vcr do
      it "returns a json object containing a movies reviews" do
        reviews = MoviesService.reviews(238)
        first_review = reviews[:results].first
        expect(reviews).to be_a(Hash)

        expect(first_review).to have_key(:author)
        expect(first_review[:author]).to be_a(String)

        expect(first_review).to have_key(:author_details)
        expect(first_review[:author_details]).to be_a(Hash)

        expect(first_review).to have_key(:content)
        expect(first_review[:content]).to be_a(String)
      end
    end
  end
end
