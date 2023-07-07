require 'rails_helper'

RSpec.describe MovieService do 
  before(:each) do 
    @mds = MovieService.new
  end

  describe 'initialize' do 
    it 'exists' do 
      expect(@mds).to be_a MovieService
    end
  end

  describe 'class methods' do 
    it '#conn' 

    it '#get_url'

    it '#top_movies' 

    it '#search_movies'
  end
end