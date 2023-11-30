require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#top_movies" do
      it "returns movie data" do
        json_response = File.read('spec/fixtures/top_twenty_movies.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
        search = MovieService.new.top_movies
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first
        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :poster_path
        expect(movie_data[:poster_path]).to be_a(String)
      end
    end

    context "#search_movies" do
      it "returns movie data" do
          specific_movie_response = File.read('spec/fixtures/search_movie_by_id.json')
               
          stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{Rails.application.credentials.tmdb[:key]}&query=268").
           with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: specific_movie_response, headers: {})
     

        search = MovieService.new.search_movies(268)
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first
        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :poster_path
        expect(movie_data[:poster_path]).to be_a(String)
      end
    end

    context "#movie_details" do
      it "returns movie details" do
        specific_movie_response = File.read('spec/fixtures/specific_movie.json')
         
    stub_request(:get, "https://api.themoviedb.org/3/movie/268?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: specific_movie_response, headers: {})

        movie_data = MovieService.new.movie_details(268)
        expect(movie_data).to be_a Hash
        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)
        expect(movie_data).to have_key :poster_path
        expect(movie_data[:poster_path]).to be_a(String)
      end
    end

    context "#movie_cast" do
      it "returns movie cast" do
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
        expect(movie_data[:cast].first).to have_key :id
        expect(movie_data[:cast].first[:id]).to be_a(Integer)
      end
    end

    context "#movie_reviews" do
      it "returns movie reviews" do
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
        expect(movie_data[:results].first).to have_key :id
        expect(movie_data[:results].first[:id]).to be_a(String)
      end
    end
  end
end