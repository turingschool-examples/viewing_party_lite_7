require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  it 'exists' do
    visit register_path

    within('#new-user-form') do
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'johndoe@yahoo.com'
      click_button 'Create New User'
    end

    expect(current_path).to eq(user_path(User.last))
  end
end
