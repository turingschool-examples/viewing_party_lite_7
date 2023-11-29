require 'rails_helper'

RSpec.describe 'User Dashboard Page' do 
  before(:each) do
    load_test_data
  end
  it "Show user's dashboard" do
    visit user_path(@user3)

    expect(page).to have_content("#{@user3.name}'s Dashboard")
    expect(page).to have_content(@user3.email)

    expect(page).to have_button("Discover Movies")

    within("div#user_parties") do
      expect(page).to have_content("These are your Viewing Parties")
      expect(page).to have_content("party1")
      expect(page).to have_content("party2")
    end
  end

  it "Has a button to discover movies" do
    visit user_path(@user3)

    expect(page).to have_button("Discover Movies")
    click_button("Discover Movies")

    expect(current_path).to eq(user_discover_index_path(@user3))
  end
end