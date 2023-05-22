require 'rails_helper'

RSpec.describe '/register', type: :feature do
  before(:each) do
    visit new_user_path
  end

  describe 'When a user visits the "/register" path' do
    it 'I should see a form to register' do
      expect(page).to have_content('Register a New User')
    end

    it 'form should include a name' do
      expect(page).to have_field('Name:')
    end

    it 'form should include an e-mail' do
      expect(page).to have_field('E-mail Address:')
    end

    it 'form should include a password field' do
      expect(page).to have_field('Password:')
    end

    it 'form should include a password confirmation field' do
      expect(page).to have_field('Password Confirmation:')
    end

    it 'form should include a register button' do
      expect(page).to have_button('Register')
    end

    it 'should take user to their user dashboard on successful registration' do
      fill_in 'Name', with: 'Jane Doe'
      fill_in 'E-mail Address:', with: 'jane-doe@gmail.com'
      fill_in 'Password:', with: '123password'
      fill_in 'Password Confirmation:', with: '123password'
      click_button 'Register'

      expected_user = User.last
      expect(current_path).to eq(user_path(expected_user))
    end

    it 'should not allow users to register without a unique e-mail address' do
      user = create(:user)

      fill_in 'Name', with: "Jane Doe"
      fill_in 'E-mail Address:', with: "#{user.email}"
      fill_in 'Password:', with: "Password123"
      fill_in 'Password Confirmation:', with: "Password123"
      click_button 'Register'

      expect(page).to have_content("Email has already been taken")
    end

    it 'should not allow users to register without a name' do
      fill_in 'E-mail Address:', with: "test@test.com"
      fill_in 'Password:', with: "Password123"
      fill_in 'Password Confirmation:', with: "Password123"
      click_button 'Register'

      expect(page).to have_content("Name can't be blank")
    end

    it 'should not allow users to register without an e-mail address' do
      fill_in 'Name', with: "Jane Doe"
      fill_in 'Password:', with: "Password123"
      fill_in 'Password Confirmation:', with: "Password123"
      click_button 'Register'

      expect(page).to have_content("Email can't be blank")
    end

    it 'should not allow users to register without matching passwords' do
      fill_in 'Name', with: "Jane Doe"
      fill_in 'E-mail Address:', with: "test@test.com"
      fill_in 'Password:', with: "Password123"
      fill_in 'Password Confirmation:', with: "XXX"
      click_button 'Register'

      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it 'should not allow users to register without filling in the password' do
      fill_in 'Name', with: "Jane Doe"
      fill_in 'E-mail Address:', with: "test@test.com"
      fill_in 'Password Confirmation:', with: "XXX"
      click_button 'Register'

      expect(page).to have_content("Password can't be blank")
    end

    it 'should not allow users to register without filling in the password confirmation' do
      fill_in 'Name', with: "Jane Doe"
      fill_in 'E-mail Address:', with: "test@test.com"
      fill_in 'Password:', with: "XXX"
      click_button 'Register'

      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
