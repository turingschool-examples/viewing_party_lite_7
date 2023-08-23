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
end