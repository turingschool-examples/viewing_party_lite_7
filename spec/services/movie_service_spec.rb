require 'rails_helper'

RSpec.describe MovieService do 
  before(:each) do 
    @ms = MovieService.new
  end

  describe 'initialize' do 
    it 'exists' do 
      expect(@ms).to be_a MovieService
    end
  end

  describe 'class methods', :vcr do 
    it '#conn' do 
      response = @ms.conn
      expect(response).to be_a Faraday::Connection
    end

    it '#get_url'

    it '#top_movies' 

    it '#search_movies'
  end
end