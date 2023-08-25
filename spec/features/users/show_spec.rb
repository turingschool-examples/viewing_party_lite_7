require 'rails_helper'

RSpec.describe 'User dashboard' do
  before do
    @ally = User.create!(name: 'Ally Jean', email: 'allyjean@example.com')
    visit user_path(@ally)
  end

  it 'has a heading' do
    expect(page).to have_content("Ally Jean's Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
  end

  it 'has a section that lists viewing parties' do
    within('#my_parties') do
      expect(page).to have_content('My Parties')
    end
  end
end
