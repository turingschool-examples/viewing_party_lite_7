require 'rails_helper'

RSpec.describe 'Movie show page', type: :feature do
  let(:user) { create(:user) }
  let(:movie_id) { 11 }  

  before do
    VCR.use_cassette('movie_details') do
      VCR.use_cassette('movie_credits') do
        visit movie_path(user, movie_id)
      end
    end
  end

  it 'shows movie details' do
    expect(page).to have_content('Star Wars')
    expect(page).to have_content('Vote Average: 8.2')
    expect(page).to have_content('Runtime: 121 minutes')
    expect(page).to have_content('Genres: Adventure, Action, Science Fiction')
    expect(page).to have_content('Summary: Princess Leia is captured and held hostage')

    within('.cast_members') do
      expect(page).to have_selector('p', count: 10)  
    end

    within('.reviews') do
      expect(page).to have_content('Reviews (0)') 
    end

    expect(page).to have_button('Create a viewing party')
    expect(page).to have_button('Return to Discover Page')
  end
end
