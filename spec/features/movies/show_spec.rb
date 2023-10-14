require 'rails_helper'

RSpec.feature 'User movie show page', type: :feature do
  it 'displays movie details', :vcr do
    user = User.create(id: 1, name: 'Weston', email: 'email.com')

    visit discover_user_path(user)


      fill_in 'query', with: 'The Matrix'
      click_button 'Search'


    click_link 'The Matrix'

    expect(current_path).to eq(user_movie_path(user, 603))
    expect(page).to have_content('The Matrix')
    expect(page).to have_content('Rating: 8.207') 
    expect(page).to have_content('Runtime: 136min')
    expect(page).to have_content('Summary')
    expect(page).to have_content('Keanu Reeves as Thomas A. Anderson / Neo')
    expect(page).to have_content('Carrie-Anne Moss as Trinity')
    expect(page).to have_content('Laurence Fishburne as Morpheus')
    expect(page).to have_content('Hugo Weaving as Agent Smith')
    expect(page).to have_content('Joe Pantoliano as Cypher')
    expect(page).to have_content('Marcus Chong as Tank')
    expect(page).to have_content('Anthony Ray Parker as Dozer')
    expect(page).to have_content('Gloria Foster as Oracle')
    expect(page).to have_content('Belinda McClory as Switch')
  end
end
