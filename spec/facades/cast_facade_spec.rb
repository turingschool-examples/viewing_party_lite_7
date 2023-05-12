require 'rails_helper'

RSpec.describe 'CastFacade', :vcr do
  before(:all) do
    @cast = CastFacade.new
  end
  
  describe 'get_cast' do
    it "lists up to 10 cast member's name and character of a movie that matches given id" do
      this_cast = @cast.get_cast('5')

      expect(this_cast).to be_an(Array)
      expect(this_cast.count).to be <= 10
    end
  end
end