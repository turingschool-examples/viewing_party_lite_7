require "rails_helper"

describe MovieFacade do
  context "class methods" do
    context "#movies" do
      before :each do
        @search = MovieFacade.new(155)
      end

      it "exists" do
        expect(@search.movies).to be_an(Array)
      end
    end
  end
end