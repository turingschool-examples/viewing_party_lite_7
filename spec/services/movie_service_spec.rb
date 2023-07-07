require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#movies" do
      it "returns movie data", :vcr do
        search = MovieService.new.movie(455476)
        expect(search).to be_a Hash
        expect(search[:adult]).to be_a FalseClass

        expect(search).to have_key :title
        expect(search[:title]).to eq("Knights of the Zodiac")
      end
    end
  end
end