require 'rails_helper'

RSpec.describe "User's Discover Movies page" do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')

    visit "/users/#{@user1.id}/discover"
  end

  it 'displays the users Discover Movies page' do
    expect(current_path).to eq("/users/#{@user1.id}/discover")
    expect(page).to have_content("Discover Movies")
  end
end