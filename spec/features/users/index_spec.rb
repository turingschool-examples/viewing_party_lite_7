require "rails_helper"

RSpec.describe "User Index Page", type: :feature do
  it "displays the title of the application" do
    visit "/"

    expect(page).to have_content("Viewing Party Redux")
  end
end