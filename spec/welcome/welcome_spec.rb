require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do 
  it 'has a root landing page' do 
    xander = User.create!(name: 'Xander Hendry', email: 'not_xanders_email@turing.edu')
    blake = User.create!(name: 'Blake S', email: 'not_blakes_email@turing.edu')
    
    visit '/'

    expect(page).to have_content('Viewing Party')
    expect(page).to have_button('Create a New User')
    expect(page).to have_content('Existing Users')
    
    expect(page).to have_link('Home')
    click_link('Home')
    expect(current_path).to eq(root_path)

    within '#users' do 
      expect(page).to have_link('not_xanders_email@turing.edu')
      expect(page).to have_link('not_blakes_email@turing.edu')
    end
  end 
end