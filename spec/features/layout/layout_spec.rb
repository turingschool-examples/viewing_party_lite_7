require "rails_helper"

RSpec.describe "layout" do
  it "displays landing page link in header" do
    visit "/"

    expect(page).to have_link("Home")

    click_link "Home"

    expect(current_path).to eq("/")
  end
end