require 'rails_helper'

RSpec.describe 'User SHow Page' do 
  before(:each) do
    load_test_data
  end

  it 'When a user visits the User Show Page.' do

    visit user_path(@user1.id)
    
    expect(page).to have_content("Toms show page")
    expect(page).to have_content(@user1.email)

  end
end