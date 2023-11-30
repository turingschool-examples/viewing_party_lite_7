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
        expect(@facade.full_details).to be_an_instance_of(MovieDetails)
      end
    end
  end
end