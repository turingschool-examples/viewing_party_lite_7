require 'rails_helper'

RSpec.describe 'new session - login page', type: :feature do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
  end

  describe 'Logging In Happy Path' do
    describe 'As a registered user' do
      it 'I see a link for Log In that goes to a Log In page with fields for e-mail and password' do
        visit root_path

        expect(page).to have_link('Log In')
        click_link 'Log In'

        expect(current_path).to eq(new_session_path)

        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
      end

      it 'when I enter my unique email and correct password I am taken to my dashboard page' do
        visit new_session_path

        fill_in :email, with: @user1.email
        fill_in :password, with: @user1.password
        click_button 'Log In'

        expect(current_path).to eq(user_path(@user1))
        expect(page).to have_content("Welcome, #{@user1.email}!")
      end
    end
  end

  describe 'Logging In Sad Path' do
    describe 'As a registered user' do
      it 'when I fail to fill in my correct credentials I am taken back to the log in page with an error' do
        visit new_session_path

        fill_in :email, with: @user1.email
        fill_in :password, with: "XYZ"
        click_button 'Log In'

        expect(current_path).to eq(new_session_path)
        expect(page).to have_content("Sorry, your credentials are not valid.")
      end
    end
  end
end
