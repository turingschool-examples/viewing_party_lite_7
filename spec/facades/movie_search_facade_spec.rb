require 'rails_helper'

RSpec.describe MovieSearchFacade do
  describe 'initialize' do
    it 'exists' do
      VCR.use_cassette("star_wars_search") do
      
      search = 'Star Wars'
      facade = MovieSearchFacade.new(search)
      expect(facade).to be_instance_of(MovieSearchFacade)
      end
    end
  end
  describe 'search results' do 
    it 'returns search results' do 
      VCR.use_cassette("star_wars_search") do
        search = 'Star Wars'
        facade = MovieSearchFacade.new(search)
        expect(facade)
      end
    end
  end
end