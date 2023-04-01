require 'rails_helper'

RSpec.describe "login" do
  before(:each) do
    @user = create(:user, password: "testing!")
    visit login_path
  end

  it 'has a form to log in' do
    expect(page).to have_field :email
    expect(page).to have_field :password
    expect(page).to have_button("Log In")
  end

  it 'allows the user to log in' do
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button("Log In")

    expect(current_path).to eq(user_path(@user.id))
  end

  it 'fails to log in with invalid input' do
    fill_in :email, with: @user.email
    fill_in :password, with: "this isnt a password"
    
    click_button("Log In")

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid Credentials")
  end

  it 'fails to log in if nothing is entered' do
    click_button("Log In")

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid Credentials")
  end
end