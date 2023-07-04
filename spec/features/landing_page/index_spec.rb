require "rails_helper"

RSpec.describe "index page" do
  it "displays landing page" do
    visit "/"
    expect(page).to have_content("Viewing Party Manager")
  end
end