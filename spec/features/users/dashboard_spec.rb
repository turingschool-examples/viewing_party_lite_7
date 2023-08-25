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
    party_1 = ViewingParty.create!(movie_id: 238, duration: 180, date: '2023-09-01', start_time: '12:00', movie_title: "The Godfather", movie_image: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
    party_2 = ViewingParty.create!(movie_id: 278, duration: 600, date: '2023-09-01', start_time: '16:00', movie_title: "Shawshank Redemption", movie_image: "/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg")
    user_party_1 = UserViewingParty.create!(user_id: monet.id, viewing_party_id: party_2.id, host: true)
    user_party_2 = UserViewingParty.create!(user_id: bob.id, viewing_party_id: party_1.id)
    
    visit user_path(monet)
    
    expect(page).to have_content("September 01, 2023")
    
    visit user_path(bob)
    
    expect(page).to have_content("September 01, 2023")
    
    visit user_path(aquaria)
    
    expect(page).to_not have_content("September 01, 2023")
  end
  
  it "displays a guest's upcoming viewing parties with attributes" do
    monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")
    bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
    party_1 = ViewingParty.create!(movie_id: 238, duration: 180, date: '2023-09-01', start_time: '12:00', movie_title: "The Godfather", movie_image: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
    party_2 = ViewingParty.create!(movie_id: 278, duration: 600, date: '2023-09-01', start_time: '16:00', movie_title: "Shawshank Redemption", movie_image: "/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg")
    user_party_1 = UserViewingParty.create!(user_id: monet.id, viewing_party_id: party_1.id, host: true)
    user_party_2 = UserViewingParty.create!(user_id: bob.id, viewing_party_id: party_2.id)
    user_party_3 = UserViewingParty.create!(user_id: aquaria.id, viewing_party_id: party_2.id, host: true)

    visit user_path(bob)

    expect(page).to have_link("Shawshank Redemption")
    expect(page).to have_content("September 01, 2023")
    expect(page).to have_content("Time: 04:00")#ran out of time, UTC threw us for a loop
    expect(page).to have_content("Host: Aquaria")
    expect(page).to have_content("Invited Guests: Bob the Dragqueen")
    expect(page).to_not have_content("Monet Xchange")
    click_link "Shawshank Redemption"
    expect(current_path).to eq(user_movie_path(bob, 278))
  end
  
  it "displays a host's upcoming viewing parties with attributes" do
    monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")
    bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
    ginger_minge = User.create!(name: "Ginger", email: "ginger@hotmess.com")

    party_2 = ViewingParty.create!(movie_id: 238, duration: 180, date: '2023-09-01', start_time: '12:00', movie_title: "The Godfather", movie_image: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
    party_3 = ViewingParty.create!(movie_id: 278, duration: 600, date: '2023-09-01', start_time: '16:00', movie_title: "Shawshank Redemption", movie_image: "/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg")
    party_4 = ViewingParty.create!(movie_id: 279, duration: 600, date: '2023-09-01', start_time: '16:00', movie_title: "Shawskank Rudemption 2", movie_image: "/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg")

    user_party_1 = UserViewingParty.create!(user_id: monet.id, viewing_party_id: party_2.id)
    user_party_2 = UserViewingParty.create!(user_id: bob.id, viewing_party_id: party_2.id)
    user_party_3 = UserViewingParty.create!(user_id: aquaria.id, viewing_party_id: party_2.id, host: true)
    user_party_4 = UserViewingParty.create!(user_id: ginger_minge.id, viewing_party_id: party_3.id)
    user_party_5 = UserViewingParty.create!(user_id: aquaria.id, viewing_party_id: party_3.id, host: true)
    user_party_6 = UserViewingParty.create!(user_id: aquaria.id, viewing_party_id: party_4.id)
    
    visit user_path(aquaria)

    save_and_open_page

    within(".my_parties") do
      expect(page).to have_link("Shawshank Redemption")
      expect(page).to have_content("September 01, 2023")
      expect(page).to have_content("Time: 04:00")#ran out of time, UTC threw us for a loop
      expect(page).to have_content("Host: Aquaria")
      expect(page).to have_content("Invited Guests: Monet Xchange Bob the Dragqueen Aquaria")

      expect(page).to have_link("The Godfather")
      expect(page).to have_content("September 01, 2023")
      expect(page).to have_content("Time: 04:00")#ran out of time, UTC threw us for a loop
      expect(page).to have_content("Host: Aquaria")
      expect(page).to have_content("Invited Guests: Aquaria Ginger")
    end
  end
end