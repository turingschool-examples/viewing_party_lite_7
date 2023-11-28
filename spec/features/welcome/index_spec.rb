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

  end
end