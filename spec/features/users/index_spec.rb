require 'rails_helper'

RSpec.describe 'User index page' do
  before :each do
    load_test_data
  end

  #  When a user visits the root path they should be on the landing page ('/') which includes:
  #  Title of Application
  #  Button to Create a New User
  #  List of Existing Users which links to the users dashboard
  #  Link to go back to the landing page (this link will be present at the top of all pages)

  it 'displays a title' do
    visit(root_path)
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'displays a button to create a new user' do
    visit(root_path)
    expect(page).to have_link('Create New User', href: register_path)
  end

  it 'displays a list of existing users' do
    visit(root_path)
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user2.email)
  end

  it 'does not display a user with a duplicate email' do
    visit(root_path)
    expect(page).to_not have_content(@user3_duplicate_email.name)
  end

  it 'displays a link to go back to the landing page' do
    visit(root_path)
    expect(page).to have_link('Home', href: root_path)
  end
end
