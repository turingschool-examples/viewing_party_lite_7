require 'rails_helper'

describe "welcome page" do
  before :each do
    @user1 = User.create!(user_name: "Bob", email: "bob@gmail.com")
    @user2 = User.create!(user_name: "Sally", email: "sally@gmail.com")
    @user3 = User.create!(user_name: "Joe", email: "joe@gmail.com")
    visit "/"
  end

  it 'Home link at the top that takes me to the welcome page' do

    expect(page).to have_link("Home")

    click_link("Home")

    expect(current_path).to eq("/")
  end

  xit 'displays button to register as a new user' do

    expect(page).to have_button("Create a New User")

    click_button("Create a New User")

    expect(current_path).to eq("/users/new")
  end

  xit 'displays existing user email addresses that are linkes to their show page' do

    expect(page).to have_link("#{@user1.email}")
    expect(page).to have_link("#{@user2.email}")
    expect(page).to have_link("#{@user3.email}")

    click_link("@user1.email")

    expect(current_path).to eq("/users/1")

    visit "/"

    click_link(@user2.email)

    expect(current_path).to eq("/users/2")
  end
end