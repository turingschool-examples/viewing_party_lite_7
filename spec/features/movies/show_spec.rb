require 'rails_helper'

RSpec.describe 'Movie show page' do
  before(:each) do
    @user_1 = User.create!(name: 'Joseph Lee', email: 'jlee230@turing.edu')
    @movie_1 = VCR.use_cassette('TMDB_movie_1')
  end
  
  it 'has navigation buttons' do
    visit("/users/#{@user_1.id}/movies/#{@movie_1.id}")

    expect(page).to have_button('Discover Page')
    expect(page).to have_button('Create Viewing Party')
  end
end