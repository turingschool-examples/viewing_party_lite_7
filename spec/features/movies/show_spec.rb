require 'rails_helper'

RSpec.describe 'Movie Detail Page', type: :feature do 
  before(:each) do 
    @user_1 = create(:user)
    @movie = Movie.new({
      id: '238',
      title: 'The Godfather', 
      vote_average: '8.7' 
    })
    visit user_movie_path(@user_1, @movie)
  end

  describe 'movie details' do 
    it 'displays title' do 
      expect(page).to have_content('The Godfather')
    end
  end
end