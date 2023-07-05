require 'rails_helper'

 
#When a user visits the '/register' path they should see a form to register.

# The form should include:

# Name
# Email (must be unique)
# Register Button
# Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.

RSpec.describe 'User registration page' do
  before(:each) do
    visit '/register'
  end

  it 'displays a new user registration form' do
    expect(page).to have_content('Register New User')
    expect(page).to have_field('name')
    expect(page).to have_field('email')
    expect(page).to have_button('Create')
  end

  it 'registers a new user' do
    fill_in 'name', with: 'John Adams'
    fill_in 'email', with: 'jadams76@gmail.com'
    click_button 'Create'

    expect(current_path).to eq("/users/#{User.last.id}")
  end
end
