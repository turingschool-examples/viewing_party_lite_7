require 'rails_helper'

RSpec.describe "User Show Page" do 
  describe "user dash" do 
    before(:each) do 
      @user_1 = User.create!(name: "Kevdog", email: "BigKev@gmail.com", password: "pass112")
      @party_1 = ViewingParty.create!(duration: 120, date: "05-03-2024", time: "03:00:00", movie_id: 1)
      @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @party_1.id)

      visit "/users/#{@user_1.id}"
    end

    it "has user's name Dash at top of page" do 
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
    end 

    it "has Button to Discover Movies" do 
      expect(page).to have_button("Discover Movies")
    end

    it "button to discover movies routes to user discover page" do 
      click_on 'Discover Movies'
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end

    it "has section that lists viewing parties" do 
      within("#viewing-parties") do 
        expect(page).to have_content("Viewing Parties")
        expect(page).to have_content(@party_1.id)
      end
    end
  end
end