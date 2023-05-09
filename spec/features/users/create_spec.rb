# frozen_string_literal: true

require 'rails_helper'

describe 'create user' do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
    visit '/register'
  end

  it 'has working registration form' do
    fill_in :name, with: 'Jane'
    fill_in :email, with: 'Its_Jane_Doe@yahoo.com'

    click_button 'Register'

    user = User.last
    expect(user.name).to eq('Jane')
    expect(current_path).to eq(user_path(user))
  end

  it 'wont allow duplicate email' do
    fill_in :name, with: 'Adam'
    fill_in :email, with: 'JoJo@hotmail.com'

    click_button 'Register'
    expect(User.last.name).to eq('JaJa')
    expect(current_path).to eq(new_user_path)
    within '#flash_message' do
      expect(page).to have_content('Error: Email has already been taken')
    end
  end

  it 'wont allow case insensitive email duplicate' do
    fill_in :name, with: 'Adam'
    fill_in :email, with: 'jojo@hotmail.com'

    click_button 'Register'
    expect(User.last.name).to eq('JaJa')
    expect(current_path).to eq(new_user_path)
    within '#flash_message' do
      expect(page).to have_content('Error: Email has already been taken')
    end
  end
end
