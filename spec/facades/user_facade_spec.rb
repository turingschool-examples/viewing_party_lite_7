require "rails_helper"

RSpec.describe UserFacade do 
  before(:each) do 
    @top_rated_search_facade = UserFacade.new(nil, "true")
    @keyword_search_facade = UserFacade.new("The Godfather", nil)
    @details_facade = UserFacade.new(nil, nil)
    @movie_id = 238
  end

  describe "user facade", :vcr do 
    it "has a top rated call" do 
      expect(@top_rated_search_facade.top_rated_call).to be_a(Array)
      expect(@top_rated_search_facade.top_rated_call.count).to eq(20)
    end

    it "has a search call" do 
      expect(@keyword_search_facade.search_call).to be_a(Array)
      expect(@keyword_search_facade.search_call.count).to eq(20)
    end

    it "can get movie details" do 
      @details_facade.get_movie_details(@movie_id)

      expect(@details_facade.details).to be_a(Hash)
      expect(@details_facade.reviews).to be_a(Hash)
      expect(@details_facade.credits).to be_a(Hash)

    end
  end
end