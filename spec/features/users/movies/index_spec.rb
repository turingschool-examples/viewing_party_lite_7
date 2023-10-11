require 'rails_helper'

RSpec.describe 'Movie Results' do
  before(:each) do
    load_test_data
  end
  describe 'happy path' do
    it 'Get top 20 rated movies' do
      # json_response = File.read('spec/fixtures/members_of_the_senate.json')
      # stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
      #    to_return(status: 200, body: json_response)
      visit "/users/#{@user1.id}/discover"
    
      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_button("Search by Movie Title")

      click_button "Discover Top Rated Movies"

      expect(page.status_code).to eq 200
      save_and_open_page
      
    end
  end
end