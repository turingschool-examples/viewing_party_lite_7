require 'rails_helper'


RSpec.describe '/users/:id', type: :feature do
  before do
    @steve = User.create!(name: "steve", email: "steve@steve.com")
    visit "/users/#{@steve.id}"
  end

  describe 'When a user visits their dashboard' do
    it "shows the 'user dashboard' header" do
      expect(page).to have_content("#{@steve.name}'s Dashboard")
    end

    it "has a button to discover movies" do
      expect(page).to have_link("Discover Movies")
      expect(page).to have_content("Lists of viewing parties")
    end

    it "when I click the discover movies button, I am redirected to the discover movies page (/users/:id/discover), where the :id is the user dashboard I was just on" do
      click_link "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(@steve.id))
    end
  end
end