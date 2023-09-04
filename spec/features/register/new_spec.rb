require 'rails_helper'

RSpec.describe 'Register User Page', type: :feature do
  describe 'When I visit `/register`' do
    before :each do 
      @pre_existing_user = create(:user)

      visit register_path
    end

    context 'it has a form to fill in' do
      it 'with fields for name, email, password, and password confirmation' do
        expect(page).to have_content('Register a New User')
        expect(page).to have_field('Name')
        expect(page).to have_field('Email')
        expect(page).to have_field('Password')
        expect(page).to have_field('Password confirmation')
        expect(page).to have_button('Create User')
      end
    end

    context 'When I fill in that form with my name, email, and matching passwords' do
      it 'redirects to the dashboard page `/users/:id`' do
        fill_in('Name', with: 'MovieWatcher1234')
        fill_in('Email', with: 'moviewatcher1234@gmail.com')
        fill_in('Password', with: 'FakePass123')
        fill_in('Password confirmation', with: 'FakePass123')

        click_button('Create User')
        
        expect(current_path).to eq(user_path(User.last))
        expect(page).to have_content("MovieWatcher1234's Dashboard")
      end
    end

    context 'When I fill out the form with invalid inputs' do
      it 'If name is blank, I see an error' do
        fill_in('Name', with: '')
        fill_in('Email', with: 'NameLast@gmail.com')
        fill_in('Password', with: 'FakePass123')
        fill_in('Password confirmation', with: 'FakePass123')

        click_button('Create User')

        expect(current_path).to eq(register_path)
        expect(page).to have_content("Name can't be blank")
      end

      it 'If email is blank, I see an error' do
        fill_in('Name', with: 'Name')
        fill_in('Email', with: '')

        click_button('Create User')

        expect(current_path).to eq(register_path)
        expect(page).to have_content("Email can't be blank")
      end

      it 'If email entered already exists, I see an error' do

        fill_in('Name', with: 'Sara')
        fill_in('Email', with: @pre_existing_user.email)
        fill_in('Password', with: 'FakePass123')
        fill_in('Password confirmation', with: 'FakePass123')

        click_button('Create User')

        expect(current_path).to eq(register_path)
        expect(page).to have_content('Email has already been taken')
      end
      
      it 'If passwords do not match, I see an error' do

        fill_in('Name', with: 'Name')
        fill_in('Email', with: 'Name.gmail.com')
        fill_in('Password', with: 'FakePass123')
        fill_in('Password confirmation', with: 'password123')

        click_button('Create User')

        expect(current_path).to eq(register_path)
        expect(page).to have_content("Password confirmation doesn't match Password")
      end
    end
  end
end