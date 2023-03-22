require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  let!(:zoidberg) { User.create!(name: "Zoidberg", email: "doc_z_berg@gmail.com") }
  it 'should be able to click on top movies button and be redirected to the movies result page where a maximum of 20 results are displayed with their respective titles and vote average ' do

    visit "/users/#{zoidberg.id}/discover"
  
    click_button("Discover Top Rated Movies")

    expect(current_path).to eq(user_movies_path)
  
    expect(page).to have_content('Matt Smith')
    expect(page).to have_content('Matt Smith')
    expect(page).to have_content('Matt Smith')

  end
end