require 'rails_helper'

RSpec.describe 'landing page' do
  before :each do
    @user1 = User.create!(name: 'Bob', email: 'blahblah@blah.com', password: 'password')
    @user2 = User.create!(name: 'Steve', email: 'steve@steve.com', password: 'password')

    @party1 = ViewingParty.create!(duration: 120, party_date: '2021-03-20', party_time: '12:00:00', movie_id: 1)
    @party2 = ViewingParty.create!(duration: 60, party_date: '2021-04-20', party_time: '09:00:00', movie_id: 2)

    @user_party1 = UserParty.create!(user_id: @user1.id, viewing_party_id: @party1.id)

    visit '/'
  end

  it "displays the welcome message" do
    expect(page).to have_content("Viewing Party")
  end

  it "displays the 'Create a New User' button" do
    expect(page).to have_link("Create a New User", href: register_path)
  end

  it "displays the 'Log In' link" do
    expect(page).to have_link("Log In", href: login_path)
  end

  it "navigates to the register page when 'Create a New User' button is clicked" do
    click_link "Create a New User"
    expect(page.current_path).to eq(register_path)
  end

  it "navigates to the login page when 'Log In' link is clicked" do
    click_link "Log In"
    expect(page.current_path).to eq(login_path)
  end
end