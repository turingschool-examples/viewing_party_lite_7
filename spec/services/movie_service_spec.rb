require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#movies" do
      it "returns movie data" do
        search = MovieService.new.movies_by_id(385687)
        require 'pry'; binding.pry
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        member_data = search[:results].first

        expect(member_data).to have_key :title
        expect(member_data[:title]).to be_a(String)
      end
    end
  end
end