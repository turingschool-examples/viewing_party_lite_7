require 'rails_helper'

RSpec.describe MoviesDetailsFacade do 
    describe 'Instance Methods', :vcr do
        it 'exists' do
            facade1 = MoviesDetailsFacade.new(13)

            expect(facade1.movie_id).to eq(13)
        end
    end
end