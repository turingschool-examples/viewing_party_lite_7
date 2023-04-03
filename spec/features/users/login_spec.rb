require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  before do
    @steve = User.create!(name: "steve", email: "steve@steve.com", password: "steve123")
    visit '/login'
  end

  it 'I should see a form to login' do
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('Login')
  end

  it "I should be taken to my dashboard when I login with valid credentials" do
    fill_in :email, with: 'steve@steve.com'
    fill_in :password, with: 'steve123'
    fill_in :password_confirmation, with: 'steve123'

    click_on 'Login'

    expect(current_path).to eq("/users/#{@steve.id}")
    expect(page).to have_content("Welcome, steve!")
  end

  describe 'sad paths for user login' do
   it 'should be redirected to login page if I wrong password' do
      fill_in :email, with: 'steve@steve.com'
      fill_in :password, with: 'wrongpassword'
      fill_in :password_confirmation, with: 'wrongpassword'

      click_on 'Login'
      expect(page).to have_content("Invalid Credentials")
      expect(current_path).to eq('/login')
   end

  #  it 'should be redirected to login page if I wrong email' do
  #   fill_in :email, with: 'wrong@wrong.com'
  #   fill_in :password, with: 'steve123'
  #   fill_in :password_confirmation, with: 'steve123'

  #   click_on 'Login'
  #   expect(page).to have_content("Invalid Credentials")
  #   expect(current_path).to eq('/login')
  #  end
  end
end