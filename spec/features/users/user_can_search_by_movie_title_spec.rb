require 'rails_helper'

feature "user can search for movies" do
  scenario "user submits valid movie name", :vcr do
    user = User.create!(name: "Bob", email: "bob@gmail.com")
    visit(user_discover_index_path(user))
    #save_and_open_page
    fill_in :search, with: 'Up'

    click_button 'Search'

    expect(page.status_code).to eq 200
    expect(page).to have_content("20 Results")
    expect(page).to have_content("Up")
  end
end

#json_response = File.read('spec/fixtures/movies.json')
       #stub_request(:get, "https://api.themoviedb.org/3/discover/movie?.json").with(params: {'api_key' => Rails.application.credentials.tmdb[:key]}).to_return(status: 200, body: json_response)