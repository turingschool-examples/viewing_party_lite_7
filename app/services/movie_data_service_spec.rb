require 'rails_helper'

RSpec.describe MovieDataService do 
  before(:each) do 
    @mds = MovieDataService.new
  end

  describe 'initialize' do 
    it 'exists' do 
      expect(@mds).to be_a MovieDataService
    end
  end

  describe '#load_data' do 
    it 'can load data from a source'
  end
end