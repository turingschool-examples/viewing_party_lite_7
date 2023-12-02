require 'rails_helper'

describe MovieCastService do
  before :each do
    oppenheimer_test_data
  end

  context "movie_cast" do
    it "provides the cast for a movie" do
      cast = MovieCastService.new.movie_cast(872585)
      actor = cast[:cast].first
      expect(cast).to be_a Hash

      expect(actor).to have_key :name
      expect(actor[:name]).to be_a String

      expect(actor).to have_key :character
      expect(actor[:character]).to be_a String

    end
  end
end