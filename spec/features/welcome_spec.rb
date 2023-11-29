require "rails_helper"

RSpec.describe "Welcome Page" do 
  it "has a root landing page" do 
    xander = User.create!(name: "Xander Hendry", email: "not_xanders_email@turing.edu")
    blake = User.create!(name: "Blake S", email: "not_blakes_email@turing.edu")
    
    visit root_path

    expect(page).to have_content("Viewing Party")
    expect(page).to have_button("Create a New User")
    expect(page).to have_content("Existing Users")
    expect(page).to have_link("Home")

    within "#users" do 
      expect(page).to have_link("not_xanders_email@turing.edu")
      expect(page).to have_link("not_blakes_email@turing.edu")
    end
  end 
end