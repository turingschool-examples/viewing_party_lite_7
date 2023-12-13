require 'rails_helper'

describe 'the User Login Page' do

  it 'logs you in when you enter the right credentials' do
    user = User.create(name: 'jhjlee702', email: 'jhjlee702@gmail.com', password: 'test')

    visit login_path

    expect(page).to have_field(:name)
    expect(page).to have_field(:password)

    fill_in :name, with: 'jhjlee702'
    fill_in :password, with: 'test'

    click_on('Log In')

    expect(current_path).to eq(user_dashboard_path(user))
    expect(page).to have_content("Welcome, #{user.name}")
  end

  it 'tells you you put in the wrong credentials when you enter a wrong password' do
    user = User.create(name: 'jhjlee702', email: 'jhjlee702@gmail.com', password: 'test')

    visit login_path

    fill_in :name, with: 'jhjlee702'
    fill_in :password, with: 'wrongpassword'

    click_on('Log In')

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
