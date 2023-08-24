require 'rails_helper'

describe MovieService do
    context "instance methods" do
        it "returns top 20 Movies", :vcr do
            service = MovieService.new
            facade = MovieFacade.new(service.top_rated)

            facade.top_movies.each do |movie|
                expect(movie).to be_a Movie
            end
        end
    end
end