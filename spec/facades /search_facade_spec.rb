require 'rails_helper'

describe SearchFacade do
    context "instance methods" do
        it "returns top 20 Movies", :vcr do
            params = { search: "top_rated" }
            facade = SearchFacade.new(params)

            facade.top_movies.each do |movie|
                expect(movie).to be_a Movie
            end
        end

        it "returns 20 movies from a keyword query", :vcr do
            params = { search: "Holiday" }
            facade = SearchFacade.new(params)

            facade.movie_query(params[:search]).each do |movie|
                expect(movie).to be_a Movie
            end
        end
        it "determines search type by params and searches accordingly", :vcr do
            params_1 = { search: "top_rated" }
            params_2 = { search: "Holiday" }

            facade_1 = SearchFacade.new(params_1)
            facade_1.search_type.each do |movie|
                expect(movie).to be_a Movie
            end

            facade_2 = SearchFacade.new(params_2)
            facade_2.search_type.each do |movie|
                expect(movie).to be_a Movie
            end

            expect(facade_1).to_not eq(facade_2)
        end
    end
end