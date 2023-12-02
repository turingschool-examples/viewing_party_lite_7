require 'rails_helper'

RSpec.describe 'Movie show page' do
  before(:each) do
    @user_1 = User.create!(name: 'Joseph Lee', email: 'jlee230@turing.edu')
  end

  it 'has a link to the landing page' do
    visit '/'

    expect(page).to have_link('Viewing Party Landing Page')
    click_link('Viewing Party Landing Page')
    expect(current_path).to eq(root_path)
  end

  it 'shows the details of a movie' do
    VCR.use_cassette('Pulp Fiction') do
      visit("/users/#{@user_1.id}/movies/680")
      expect(page.status_code).to eq(200)
      expect(page).to have_content('Title: Pulp Fiction')
      expect(page).to have_content('Vote Average:')
      expect(page).to have_content('2 hours and 34 minutes')
      expect(page).to have_content('Thriller')
      expect(page).to have_content('burger-loving')
      expect(page).to have_content('John Travolta')
      expect(page).to have_content('Vote Count:')
      expect(page).to have_content('Review Author:')
      expect(page).to have_content('Review Text:')
      expect(page).to have_button('Discover')
      expect(page).to have_button('Create a Viewing Party')
    end
  end
end
