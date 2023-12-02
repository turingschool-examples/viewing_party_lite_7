require 'rails_helper'

describe MovieCastFacade do
  context "class methods" do
    context "#movie_cast" do
      before :each do
        oppenheimer_test_data
        @test_cast = MovieCastFacade.new(872585)
      end

      it "exists" do
        expect(@test_cast.class).to be(MovieCastFacade)
      end

      it "can create an array of poros of the movie reviews" do
        expect(@test_cast.movie_cast.class).to eq(Array)
        
        cast_test = @test_cast.movie_cast.first
        expect(cast_test).to be_a(MovieActor)
        expect(cast_test).to respond_to(:name)
        expect(cast_test).to respond_to(:character)
      end
    end
  end
end