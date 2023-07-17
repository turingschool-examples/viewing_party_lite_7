require 'rails_helper'

RSpec.describe "landing page", type: :feature do
  before :each do
    @user1 = User.create!(user_name: "Steve", email: "Steve@email.com", password: 'password123', password_confirmation: 'password123')
    @user2 = User.create!(user_name: "Ben", email: "Ben@email.com", password: 'password345', password_confirmation: 'password345')
    @user3 = User.create!(user_name: "Jane", email: "Jane@email.com", password: 'password567', password_confirmation: 'password567')
    visit "/"
  end

  it "displays the title of the application" do
    expect(page).to have_content("Viewing Party")
  end

  it 'displays a home link at the top that takes me to the landing page' do

    expect(page).to have_link("Home")

    click_link("Home")

    expect(current_path).to eq("/")
  end

  it 'displays button to register as a new user' do
    expect(page).to have_button("Create a New User")

    click_button("Create a New User")

    expect(current_path).to eq("/register")
  end

  it 'displays existing user email addresses that are linkes to their show page' do

    expect(page).to have_link("#{@user1.email}")
    expect(page).to have_link("#{@user2.email}")
    expect(page).to have_link("#{@user3.email}")

    click_link("#{@user1.email}")

    expect(current_path).to eq("/users/#{@user1.id}")

    visit "/"

    click_link(@user2.email)

    expect(current_path).to eq("/users/#{@user2.id}")
  end
end