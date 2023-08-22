require 'rails_helper'

RSpec.describe "landing page" do
  before do
    @user_1 = User.create!(name: "Bob", email: "bob@gmail.com", id: 1)
    @user_2 = User.create!(name: "Jane", email: "jane@gmail.com", id: 2)
    @user_3 = User.create!(name: "Tom", email: "tom@gmail.com", id: 3)

    visit "/"
  end

  it "displays the title of the application" do
    expect(page).to have_content("Viewing Party")
  end

  it "displays a button to Create a New User" do
    expect(page).to have_button("Create New User")

    click_button "Create New User"

    expect(current_path).to eq("/register")
    
  end

  it "displays existing user email addresses" do 
    expect(page).to have_link(@user_1.email)
    expect(page).to have_link(@user_2.email)
    expect(page).to have_link(@user_3.email)

    click_link @user_1.email

    expect(current_path).to eq("/users/1")
    expect(current_path).to_not eq("/users/2")

    visit "/"

    click_link @user_2.email

    expect(current_path).to eq("/users/2")
    expect(current_path).to_not eq("/users/1")

  end
end
