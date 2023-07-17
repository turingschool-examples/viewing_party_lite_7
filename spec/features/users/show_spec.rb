require 'rails_helper'

RSpec.describe 'User dashboard page', type: :feature do
  before :each do
    @user1 = User.create!(user_name: "Steve", email: "Steve@email.com", password: 'password123', password_confirmation: 'password123')
    @user2 = User.create!(user_name: "Ben", email: "Ben@email.com", password: 'password345', password_confirmation: 'password345')
    @user3 = User.create!(user_name: "Jane", email: "Jane@email.com", password: 'password567', password_confirmation: 'password567')
  end

  it 'displays user first name at the top of the page' do
    visit "/users/#{@user1.id}"

    expect(page).to have_content("#{@user1.user_name}'s Dashboard")
  end

  it 'displays a button to discover movies' do
    visit "/users/#{@user1.id}"

    expect(page).to have_button("Discover Movies")

    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'displays section that lists viewing parties' do
    visit "/users/#{@user1.id}"

    expect(page).to have_content("List of Viewing Parties")
  end
end