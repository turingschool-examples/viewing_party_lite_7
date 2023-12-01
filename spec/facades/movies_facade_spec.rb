require 'rails_helper'

RSpec.describe MoviesFacade, type: :facade do
  describe 'Movie Facade Instance Methods', :vcr do
    before(:each) do
      @facade = MoviesFacade.new  
    end

    it "exists" do
      expect(@facade).to be_a(MoviesFacade)
    end

    it "#search" do
      search_results = @facade.search("The Godfather")

      expect(search_results).to be_a(Array)
      search_results.each do |search_result|
        expect(search_result).to be_a(Movie)
        expect(search_result).to respond_to(:title)
        expect(search_result).to respond_to(:vote_average)
        expect(search_result).to respond_to(:id)
        expect(search_result).to respond_to(:summary)
        expect(search_result).to respond_to(:reviews)
      end
    end

    it "#top_rated" do
      top_rateds = @facade.top_rated

      expect(top_rateds).to be_a(Array)

      top_rateds.each do |top_rated|
        expect(top_rated).to be_a(Movie)
        expect(top_rated).to respond_to(:title)
        expect(top_rated).to respond_to(:vote_average)
        expect(top_rated).to respond_to(:id)
        expect(top_rated).to respond_to(:summary)
        expect(top_rated).to respond_to(:reviews)
      end
    end

    it "#find_movie" do
      movie = @facade.find_movie(238)

      expect(movie).to be_a(Movie)
      expect(movie).to respond_to(:title)
      expect(movie).to respond_to(:vote_average)
      expect(movie).to respond_to(:id)
      expect(movie).to respond_to(:summary)
      expect(movie).to respond_to(:reviews)
    end
  end
end
