require "rails_helper"

RSpec.describe "Welcome Index" do
  before(:each) do
    load_test_data
  end

  it "When users visits '/' we see all users" do
    visit "/"

    expect(page).to have_content("Title of Application")

    # expect(page).to have_button("Create an Account")
    # click_button("Create an Account")
    # expect(current_path).to eq("/register")
    # expect(page).to have_link("Home")
    # click_link("Home")
    # expect(current_path).to eq("/")


    visit "/"
    # expect(page).to have_link("Capitainlearyo")
    expect(page).to have_content("Capitainlearyo")
    # click_link("Capitainlearyo")
    # expect(current_path).to eq("/users/#{@user1.id}")

    visit "/"
    # expect(page).to have_link("Slick Ric")
    expect(page).to have_content("Slick Ric")
    # click_link("Slick Ric")
    # expect(current_path).to eq("/users/#{@user2.id}")

  end
end