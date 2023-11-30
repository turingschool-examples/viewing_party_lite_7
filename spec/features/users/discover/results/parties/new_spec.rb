require 'rails_helper'

RSpec.describe 'new user movie party page', type: :feature do
  before :each do
    movie_details = {
      id: 7,
      vote_average: 8.200,
      original_title: "Howl's Moving Castle",
      genres: 'animation',
      overview: 'When an unconfident young woman is cursed with an old body by a spiteful witch',
      name: 'Takuya Kimura',
      character: 'Howl',
      total_results: 5,
      author: 'randoms',
      content: 'good stuff'
    }
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
    @movie1 = Movie.new(movie_details)
  end

  it 'lists the current movie title' do
    visit new_user_movie_party_path(@user1, @movie1)
    
  end

  it 'has a form to create a new party, duration defaulting to movie runtime' do
    visit new_user_movie_party_path(@user1, @movie1)
  end

  context 'when filled out with valid data' do
    it 'form submission creates a new party and redirects back to discover page' do
      visit new_user_movie_party_path(@user1, @movie1)
    end
  end

  context 'when filled out with invalid data' do
    it 'form submission pushes a flash error and redirects back' do
      visit new_user_movie_party_path(@user1, @movie1)
    end
  end
end
