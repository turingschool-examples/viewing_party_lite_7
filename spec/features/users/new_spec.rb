require 'rails_helper'

describe 'the User Registration Page' do
  before(:each) do
  end

  it 'has a link to the landing page' do
    visit '/'

    expect(page).to have_link('Viewing Party Landing Page')
    click_link('Viewing Party Landing Page')
    expect(current_path).to eq(root_path)
  end
  
  it 'shows the fields to enter new user information' do
    visit register_path
    expect(page).to have_content('Register an Account')
    expect(page).to have_field('user[name]', type: 'text')
    expect(page).to have_field('user[email]', type: 'email')
    expect(page).to have_button('Register')

    fill_in 'user[name]', with: 'Thomas Smith'
    fill_in 'user[email]', with: 'tsmith11@turing.edu'

    click_on('Register')

    x = User.find_by(email: 'tsmith11@turing.edu')

    expect(current_path).to eq(user_dashboard_path(x.id))
    expect(page).to have_content("Thomas Smith's Dashboard")
    expect(page).to have_content("Parties I'm Hosting")
    expect(page).to have_content("Parties I'm Invited To")
    expect(page).to have_button('Discover Movies')
  end

  it 'prevents users with non-unique emails' do
    visit register_path
    fill_in 'user[name]', with: 'Thomas Smith'
    fill_in 'user[email]', with: 'tsmith11@turing.edu'
    click_on('Register')
    visit register_path
    fill_in 'user[name]', with: 'Thomas Smith'
    fill_in 'user[email]', with: 'tsmith11@turing.edu'
    click_on('Register')

    expect(current_path).to eq(register_path)
  end
end
