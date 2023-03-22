require "rails_helper" 

describe MovieService do 
  context "class methods", :vcr do 
    context "#top_rated_call" do 
      it "returns top rated info" do 
        search = MovieService.new.top_rated_call 
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first 

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context "#search_call" do 
      it "returns searched movie title info" do 
        query = "The Godfather"
        search = MovieService.new.search_call(query) 
        expect(search).to be_a Hash
        
        movie_data = search[:results].first 

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context "details call" do 
      it "returns the movie details" do 
        movie_id = 238
        search = MovieService.new.details_call(movie_id)

        expect(search).to be_a Hash

        expect(search).to have_key :original_title 
        expect(search).to have_key :vote_average
        expect(search).to have_key :runtime
        expect(search).to have_key :genres
        expect(search).to have_key :overview
      end
    end

    context "reviews call" do 
      it "returns the movie review details" do 
        movie_id = 238
        search = MovieService.new.reviews_call(movie_id)

        expect(search).to be_a Hash

        expect(search).to have_key :total_results
        expect(search[:results][0]).to have_key :author
        expect(search[:results][0]).to have_key :author_details
      end
    end

    context "credits call" do 
      it "returns the movie credits details" do 
        movie_id = 238
        search = MovieService.new.credits_call(movie_id)

        expect(search).to be_a Hash
  
        expect(search[:cast][0]).to have_key :name
        expect(search[:cast][0]).to have_key :character
      end
    end
  end
end