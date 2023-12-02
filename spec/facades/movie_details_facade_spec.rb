require 'rails_helper'

RSpec.describe MovieDetailsFacade do
  describe "facade returns details", :vcr do
    before(:each) do
      @movie_id = 438631
      @facade = MovieDetailsFacade.new(@movie_id)
    end
    
    it 'exists' do
      expect(@facade).to be_an_instance_of(MovieDetailsFacade)
      expect(@facade.full_details).to be_an_instance_of(MovieDetails)
    end

    describe "#details" do
      it "returns a newly created MoviesDetails poro" do
        VCR.use_cassette("test details movie and single") do
        expect(@facade.full_details).to be_an_instance_of(MovieDetails)
        expect(@facade.single_movie_details).to be_an_instance_of(SingleMovieDetails)
        expect(@facade.single_movie_details.id).to eq(438631)
        expect(@facade.single_movie_details.movie_title).to eq("Dune")
        expect(@facade.single_movie_details.runtime).to eq(155)
        runtime_test = @facade.full_details
        expect(runtime_test.format_runtime).to eq("2h 35m")
        end
      end
    end
  end
end