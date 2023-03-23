require 'rails_helper'

RSpec.describe MoviedbFacade do
  describe "class methods" do
    context ":get_movie_search" do
      it "returns array of movie objects" do
        expect(MoviedbFacade.get_movie_search("space")).to be_an(Array)
        expect(MoviedbFacade.get_movie_search("space").first).to be_a(Movie)
      end
    end
  end
end