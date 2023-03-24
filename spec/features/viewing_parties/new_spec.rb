require "rails_helper"

RSpec.describe "New Viewing Party Page" do
  before(:each) do
    @user = User.create!(name: "Bob", email: "bob@bob.bob")
    VCR.use_cassette(:movie_details, serialize_with: :json) do
      visit "/users/#{@user.id}/movies/238/viewing-party/new"
    end
  end

  context "When I visit the new viewing party page" do 
    it "I should see the movie title rendered, along with a form to fill out viewing party attributes" do
      
      expect(page).to have_content("The Godfather")
      
      fill_in "Duration of Party", with: 240
      fill_in "When", with: "03-24-2023"
      fill_in "Start Time", with: "18:00"
      
      expect(page).to have_selector("input[type='checkbox'][value='#{@user.id}']")
      
      click_on "Create Party"
      
      expect(current_path).to eq("/users/#{User.last.id}")
    end
  end
end