require 'rails_helper'

describe "Welcome Index Page" do
  it "can see a welcome message" do
    visit root_path

    expect(page).to have_content("Welcome to Viewing Party")
  end
end