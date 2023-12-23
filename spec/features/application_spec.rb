require 'rails_helper'

RSpec.describe 'application (/)' do
  before :each do
    @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu', password: 'test', password_confirmation: 'test')
    @user2 = User.create!(name: 'Paul', email: 'paul@turing.edu', password: 'test', password_confirmation: 'test')
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu', password: 'test', password_confirmation: 'test')
  end

  describe 'as a visitor' do
    describe 'when I visit /' do
      it 'shows the title of the application (Viewing Party)' do
        visit '/'

        expect(page).to have_content('Viewing Party')
      end

      it 'has a button to create a new user' do
        visit '/'

        expect(page).to have_button('Create a New User')

        click_button('Create a New User')

        expect(current_path).to eq(register_path)
      end

      # xit 'has a list of existing users and links to their dashboard' do
      #   visit '/'

      #   expect(page).to have_content('Existing Users')
      #   expect(page).to have_link(@user1.email)
      #   expect(page).to have_link(@user2.email)
      #   expect(page).to have_link(@user3.email)

      #   click_link(@user3.email)

      #   expect(current_path).to eq(user_path(@user3))
      # end

      it 'has a link that takes you back to the landing page' do
        visit '/'

        expect(page).to have_link('Home')

        click_link('Home')
        expect(current_path).to eq('/')
      end

      it 'has a link to log in' do
        visit '/'
        expect(page).to have_button('Log In')

        click_button('Log In')

        expect(current_path).to eq('/login')
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)

        fill_in(:email, with: 'sooyung@turing.edu')
        fill_in(:password, with: 'test')

        click_button 'Log In'

        expect(current_path).to eq(user_path(@user3))
      end

      it 'does not log in with incorrect credentials' do
        visit '/'
        click_button 'Log In'

        fill_in(:email, with: 'sooyung@turing.edu')
        fill_in(:password, with: 'wrong_password')

        click_button 'Log In'

        expect(current_path).to eq('/login')

        expect(page).to have_content('Sorry, your credentials are bad.')
      end

      it 'does not log in with incorrect credentials' do
        visit '/'
        click_button 'Log In'

        fill_in(:email, with: '')
        fill_in(:password, with: '')

        click_button 'Log In'

        expect(current_path).to eq('/login')
        expect(page).to have_content('Please enter correct email and password')
      end

      it 'does not show existing users' do
        visit '/'

        expect(page).to_not have_content('Existing Users')
      end

      it 'shows list of users if you are a registered user' do
        visit '/'
        click_button('Log In')
        fill_in(:email, with: 'sooyung@turing.edu')
        fill_in(:password, with: 'test')
        click_button('Log In')
        visit '/'

        expect(page).to have_content('brendan@turing.edu')
        expect(page).to have_content('paul@turing.edu')
        expect(page).to have_content('sooyung@turing.edu')
      end
    end
  end
end
