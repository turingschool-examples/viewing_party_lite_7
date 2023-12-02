require 'rails_helper'

RSpec.describe UserFacade do
  describe "facade returns details", :vcr do
    before(:each) do
      @user = User.create!(name: 'Kiwi', email: 'kiwibird@gmail.com')
      @facade = UserFacade.new(@user.id)
    end

    it 'exists' do
      expect(@facade).to be_an_instance_of(UserFacade)
      expect(@facade.user).to be_an_instance_of(User)
    end

    it 'returns a link to grab a movie poster from TMDB' do
      expect(@facade.movie_poster_link(346698)).to be_a String
    end

    it 'returns a movie title from TMDB' do
      expect(@facade.get_movie_title(346698)).to be_a String
    end
  end
end
