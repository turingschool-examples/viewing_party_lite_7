# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesDetailsFacade do
  describe "VCR block", :vcr do
    before(:each) do
      @movie_id = 926393
      @facade = MoviesDetailsFacade.new(@movie_id)
    end
    
    it 'exists' do
      expect(@facade).to be_an_instance_of(MoviesDetailsFacade)
      expect(@facade.movie_details).to be_an_instance_of(MoviesDetails)
    end

    describe "#details" do
      it "returns a newly created MoviesDetails poro" do
        expect(@facade.details).to be_an_instance_of(MoviesDetails)
      end
    end
  end
end
