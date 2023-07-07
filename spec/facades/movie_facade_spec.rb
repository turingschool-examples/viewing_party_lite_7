require 'rails_helper'

RSpec.describe MovieFacade do 
  before(:each) do 
    @mf = MovieFacade.new 
    @mf_search = MovieFacade.new('neverending')
  end

  describe 'initialize' do 
    it 'exists and has attributes..or not' do 
      expect(@mf).to be_a MovieFacade
      expect(@mf_search).to be_a MovieFacade
      expect(@mf_search.search).to eq('neverending')
    end
  end
end