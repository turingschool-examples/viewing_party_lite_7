require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    visit root_path
  end

  scenario "displays title of Application" do
    expect(page).to have_content("Viewing Party")
  end

  scenario "has link to return to home page" do
    within 'nav' do
      expect(page).to have_link('Home', href: root_path)
    end
  end

  scenario "has button to create new user" do
    expect(page).to have_link("Create New User")
    click_on "Create New User"

    expect(current_path).to eq("/register")
  end

  describe "list of existing users" do
  end
end