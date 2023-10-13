require "rails_helper"

RSpec.describe MovieService do
  it "exists" do
    ms = MovieService.new

    expect(ms).to be_a MovieService
  end

  context "class methods" do
    context "#end_point", :vcr do
      it "connects endpoints to the base api url" do
        service = MovieService.new
        results = service.end_point("3/movie/238?language=en-US")
        
        expect(results).to be_a Hash
        expect(results[:genres]).to be_an Array
        expect(results[:id]).to be_an Integer
        expect(results[:original_title]).to be_a String
        expect(results[:overview]).to be_a String
        expect(results[:poster_path]).to be_a String
        expect(results[:vote_average]).to be_a Float
      end
    end
  end
end