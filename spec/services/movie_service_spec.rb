require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#movie_by_id" do
      it "returns individual movie data", :vcr do
        search = MovieService.new.movie_by_id(455476)

        expect(search).to be_a Hash
        expect(search[:adult]).to be_a FalseClass

        expect(search).to have_key :title
        expect(search[:title]).to eq("Knights of the Zodiac")

        expect(search).to have_key :runtime
        expect(search[:runtime]).to eq(113)

        expect(search).to have_key :vote_average
        expect(search[:vote_average]).to eq(6.545)

        expect(search).to have_key :popularity
        expect(search[:popularity]).to eq(1701.639)

        expect(search).to have_key :id
        expect(search[:id]).to eq(455476)

        expect(search).to have_key :overview
        expect(search[:overview]).to eq("When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?")

        expect(search).to have_key :genres
        expect(search[:genres]).to be_an(Array)
        expect(search[:genres].first[:id]).to eq(14)
        expect(search[:genres].first[:name]).to eq("Fantasy")
      end
    end
  end
end