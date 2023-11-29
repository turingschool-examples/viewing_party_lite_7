require 'rails_helper'

RSpec.describe 'Movie Facade' do
  it 'should call the facade and return results', :vcr do

      results = MovieFacade.top_rated
      expect(results).to be_a("Poro not ready")
  end

  it 'Sad Path bad input should call the facade and retrieve search results' do
    
  end
end