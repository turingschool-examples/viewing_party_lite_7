require "rails_helper"

RSpec.describe "Welcome Index" do
  before(:each) do
    load_test_data
  end

  it "When users visits '/' we see all users" do
    visit "/"

    expect(page).to have_content("ViewingPartyLite7")
    expect(page).to have_link("Home")
    expect(page).to have_button("Create a New User")

    expect(page).to have_link("Capitainlearyo")
    expect(page).to have_link("Slick Ric")
    expect(page).to have_link("Bob")

    click_link "Bob"
    expect(current_path).to eq(user_path(@user3.id))

    visit user_path(@user3.id)

    expect(page).to have_link("Home")
    click_link "Home"
    expect(current_path).to eq(root_path)
  end
end