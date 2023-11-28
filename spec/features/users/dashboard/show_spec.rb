require 'rails_helper'

RSpec.describe '#show', type: :feature do
  it 'shows the name of the user next to dashboard' do
    user1 = User.create!(name: "John Doe", email: "JohnDoe@email")
    visit "users/#{user1.id}"

    expect(page).to have_content("#{user1.name} Dashboard")
  
  end

end