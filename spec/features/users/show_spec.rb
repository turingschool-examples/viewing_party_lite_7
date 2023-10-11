require 'rails_helper'

RSpec.describe 'User SHow Page' do 
  before(:each) do
    load_test_data
  end

  it 'When a user visits the User Show Page.' do

    visit user_path(@user1.id)
    
    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_content(@user1.email)

    within ("##{@party1.id}") do
    expect(page).to have_content(@party1.id)
    expect(page).to have_content(@party1.name)
    end

    within ("##{@party2.id}") do
    expect(page).to have_content(@party2.id)
    expect(page).to have_content(@party2.name)
    end

  end
end