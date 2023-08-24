require "rails_helper"

describe MovieService do
  describe "class methods" do
    describe ".find_top_rated" do
      it "returns top rated", :vcr do
        response = MovieService.find_top_rated

        expect(response).to be_a Hash
        expect(response[:results]).to be_an Array
        expect(response[:results][0]).to have_key(:title)
        expect(response[:results][0]).to have_key(:vote_average)
      end
    end
  end

end