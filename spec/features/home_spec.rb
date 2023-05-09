require 'rails_helper'

RSpec.describe "Home page", type: :feature do
  let!(:users) { create_list(:user, 3) }

  it "home page" do
    visit root_path
    
    expect(page).to have_link "Home", href: root_path

    expect(page).to have_content "Viewing Party"

    expect(page).to have_button "Create a New User"

    users.each do |user|
      expect(page).to have_link user.name, href: user_path(user)
    end
  end
end
