require 'rails_helper'

describe MovieService do
    context "class methods" do
        context "#top_rated" do
            it "returns 10 movies", :vcr do
                discover = MovieService.new.top_rated

                expect(discover).to be_a Hash
                expect(discover[:results]).to be_an Array

                movie = discover[:results].first

                expect(movie).to have_key :title
                expect(movie[:title]).to be_a(String)
        
                expect(movie).to have_key :original_title
                expect(movie[:original_title]).to be_a(String)
        
                expect(movie).to have_key :overview
                expect(movie[:overview]).to be_a(String)
        
                expect(movie).to have_key :popularity
                expect(movie[:popularity]).to be_a(Float)
            end
        end
    end
end