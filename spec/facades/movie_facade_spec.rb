require 'rails_helper'
RSpec.describe MoviesFacade do


  it 'creates movies objects of the top rated movies' do 
    VCR.use_cassette("top_rated_movies") do
      expect(MoviesFacade.top_rated_movies.first).to be_a(Movies)
    end
  end 

  it 'creates movies objects of the results returned by the search' do 
    VCR.use_cassette("search_results_green") do
      expect(MoviesFacade.search_results("green").first).to be_a(Movies)
    end
    VCR.use_cassette("search_results_green") do
      expect(MoviesFacade.search_results("green").first.name.downcase).to include("green")
    end 
  end

end