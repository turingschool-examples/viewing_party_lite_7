require 'rails_helper'

RSpec.describe "User Dashboard" do
  it "displays user name, discover movies button, and a viewing parties section" do
    monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")
    bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
    
    visit user_path(monet)

    expect(page).to have_content("Monet Xchange's Dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end

  it "has a button discover a user's movies" do
    monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")

    visit user_path(monet) 

    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_path(monet))
  end

  it 'should display a list of viewing parties the user is hosting' do 
    monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")
    bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
    party_1 = ViewingParty.create!(movie_id: 238, duration: 180, date: '2023-09-01', start_time: '12:00')
    party_2 = ViewingParty.create!(movie_id: 278, duration: 600, date: '2023-09-01', start_time: '16:00')
    user_party_1 = UserViewingParty.create!(user_id: monet.id, viewing_party_id: party_2.id, host: true)
    user_party_2 = UserViewingParty.create!(user_id: bob.id, viewing_party_id: party_2.id)

    visit user_path(monet)
    
    expect(page).to have_content("September 01, 2023")

    visit user_path(bob)

    expect(page).to have_content("September 01, 2023")

    visit user_path(aquaria)

    expect(page).to_not have_content("September 01, 2023")
  end
end