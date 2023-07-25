require 'rails_helper'

RSpec.describe "landing page", type: :feature do
  it "displays the title of the application" do
    @user1 = User.create!(user_name: "Steve", email: "Seve@email.com", password: 'password123', password_confirmation: 'password123')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    visit root_path
    expect(page).to have_content("Viewing Party")
  end

  it 'displays a home link at the top that takes me to the landing page' do
    @user1 = User.create!(user_name: "Steve", email: "Stee@email.com", password: 'password123', password_confirmation: 'password123')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    visit root_path
    expect(page).to have_link("Home")

    click_link("Home")

    expect(current_path).to eq("/")
  end

  it 'displays button to register as a new user' do
    visit root_path
    expect(page).to have_link("Create User")

    click_on("Create User")

    expect(current_path).to eq("/register")
  end

  # it 'displays existing user email addresses that are linkes to their show page' do

  #   expect(page).to have_link("#{@user1.email}")
  #   expect(page).to have_link("#{@user2.email}")
  #   expect(page).to have_link("#{@user3.email}")

  #   click_link("#{@user1.email}")

  #   expect(current_path).to eq("/users/#{@user1.id}")

  #   visit "/"

  #   click_link(@user2.email)

  #   expect(current_path).to eq("/users/#{@user2.id}")
  # end
end