require 'rails_helper'

describe MoviesFacade do
  context "class methods" do
    context "#movie_search" do
      it "returns movie objects from keyword search" do
        search = MoviesFacade.new.movie_search("dog")
        expect(search).to be_a Object 

        expect(search.title).to be_a String
        expect(search.id).to be_an Integer
        expect(search.title).to be_a Float
      end
    end
  end
end
