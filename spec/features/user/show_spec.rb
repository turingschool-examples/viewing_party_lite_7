require "rails_helper"

RSpec.describe "User Registration Page" do

  before(:each) do
      create_list(:user, 2)
      @user_1 = User.create!(name: "Anna Wiley", email: "awiley33@gmail.com")
      @user_2 = User.all[0]
      @user_3 = User.all[1]
      
      create(:viewing_party, user: @user_1, movie_id: 238)
      create(:viewing_party, user: @user_1, movie_id: 240)
      create(:viewing_party, user: @user_2, movie_id: 242)
      create(:viewing_party, user: @user_3, movie_id: 248)
      create(:viewing_party, user: @user_3, movie_id: 250)

      
      @viewing_party_1 = ViewingParty.all[0]
      @viewing_party_2 = ViewingParty.all[1]
      @viewing_party_3 = ViewingParty.all[2]
      @viewing_party_4 = ViewingParty.all[3]
      
      create_list(:viewing_party_user, 4, viewing_party: @viewing_party_1)
      create_list(:viewing_party_user, 6, viewing_party: @viewing_party_2)
      create_list(:viewing_party_user, 2, viewing_party: @viewing_party_3)
      create(:viewing_party_user, viewing_party: @viewing_party_3, user: @user_1)
      create(:viewing_party_user, viewing_party: @viewing_party_4, user: @user_1)
      create(:viewing_party_user, viewing_party: @viewing_party_3, user: @user_3)

      visit user_path(@user_1)       

  end

  it "displays Name's Dashboard at the top of the page", :vcr do
    expect(page).to have_content("Anna Wiley's Dashboard")
  end

  it "has a button to discover movies", :vcr do
    expect(page).to have_button("Discover Movies")
  end

  it "has a section that lists this user's viewing parties", :vcr do
    save_and_open_page
  end
end