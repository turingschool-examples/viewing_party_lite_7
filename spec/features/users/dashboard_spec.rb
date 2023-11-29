# frozen_sting_literal: true

require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  it 'displays a Users dashboard' do
    kam = User.create!(name: "Kam", email: "doofus23@gmail.com")

    visit "/users/#{kam.id}"
    
    expect(page).to have_link("Home")
    expect(page).to have_content("Kam's Dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end
end 
