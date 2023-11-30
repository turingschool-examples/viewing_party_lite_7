require "rails_helper"

RSpec.describe MovieFacade do
  context "Instance methods" do
    context "#top_movie" do
      it "returns facade" do
        json_response = File.read('spec/fixtures/top_twenty_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
         
        facade = MovieFacade.new
        result = facade.top_movies
        expect(result.first.title).to be_a(String)
      end
    end

    context "#search_movies" do
      it "returns facade" do
        json_response = File.read('spec/fixtures/batman_movies.json')
        stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{Rails.application.credentials.tmdb[:key]}&query=Batman").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
        facade = MovieFacade.new
        result = facade.search_movies("Batman")
        expect(result.first.title).to be_a(String)
      end
    end

    context "#movie_details" do
      it "returns facade" do
        specific_movie_response = File.read('spec/fixtures/specific_movie.json')
         
        stub_request(:get, "https://api.themoviedb.org/3/movie/268?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: specific_movie_response, headers: {})

        facade = MovieFacade.new
        result = facade.movie_details(268)
        expect(result).to be_a Hash
      end
    end

    context "#movie_cast" do
      it "returns facade" do
    credits_response = File.read('spec/fixtures/specific_movie_credits.json')

         stub_request(:get, "https://api.themoviedb.org/3/movie/268/credits?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: credits_response, headers: {})

        movie_data = MovieService.new.movie_cast(268)
        expect(movie_data).to be_a Hash
      end
    end

    context "#movie_reviews" do
      it "returns facade" do
      reviews_response = File.read('spec/fixtures/specific_movie_reviews.json')

         stub_request(:get, "https://api.themoviedb.org/3/movie/268/reviews?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: reviews_response, headers: {})
         
        movie_data = MovieService.new.movie_reviews(268)
        expect(movie_data).to be_a Hash
      end
    end
  end
end