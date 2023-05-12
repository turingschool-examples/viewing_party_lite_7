require 'rails_helper'

RSpec.describe 'Movie show page', type: :feature do
  let(:user) { create(:user) }
  let(:movie_id) { 11 }  

  before { visit movie_path(id: user.id, movie_id: movie_id) }


  it 'shows movie details', :vcr do
    expect(page).to have_content('Star Wars')
    expect(page).to have_content('Vote: 8.2')
    expect(page).to have_content('Runtime: 121 minutes')
    expect(page).to have_content('Genre: Adventure, Action, Science Fiction')
    expect(page).to have_content('Summary: Princess Leia is captured and held hostage')

    within('.cast_members') do
      expect(page).to have_selector('p', count: 10)  
    end

    within('.reviews') do
      expect(page).to have_content('(0) Reviews') 
    end

    expect(page).to have_button('Create a viewing party')
    expect(page).to have_button('Discover Page')
  end
end
