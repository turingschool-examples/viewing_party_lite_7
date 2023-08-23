require "rails_helper"

RSpec.describe "user registration page" do
  before(:each) do
    @user1 = User.create!(name: "Flick Chick", email: "flick@yahoo.com")
    @user2 = User.create!(name: "Rom Com Ron", email: "comron@yahoo.com")
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end
  it "should contain a user registration form and test uniqueness of email" do
    visit "/register"

    expect(page).to have_field("Name")
    fill_in "Name", with: "PopCorn"
    expect(page).to have_field("Email")

    fill_in "Email", with: "popcornfool@gmail.com"

    expect(page).to have_button("Register")
    click_button "Register"
    expect(current_path).to eq(user_path(User.last))
    
    visit "/register"

    expect(page).to have_field("Name")
    fill_in "Name", with: "PopCorn"
    expect(page).to have_field("Email")

    fill_in "Email", with: "popcornfool@gmail.com"

    expect(page).to have_button("Register")
    click_button "Register"
    expect(page).to have_content("Data Invalid")
  end
end