require 'rails_helper'

feature "User registration" do
  scenario "User registers and is taken to their dashboard" do
    visit new_user_path

    fill_in "Name", with: "Snoop Dogg"
    fill_in "Email", with: "snoop@dogg.com"
    click_button "Register"

    user = User.find_by(email: "snoop@dogg.com")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Snoop Dogg")
    expect(page).to have_content("snoop@dogg.com")
  end
end