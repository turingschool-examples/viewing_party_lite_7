require 'rails_helper' 

RSpec.describe '/register', type: :feature do 
  describe 'new user creation'
    before(:each) do 
      visit "/register"
    end

    it 'form to register has a descriptive header' do 
      expect(page).to have_content('Register a New User')
      expect(page).to have_content('Name:')
      expect(page).to have_content('Email:')
    end

    it 'has a form to register' do 
      expect(page).to have_field('Name:')
      expect(page).to have_field('Email:')
      expect(page).to have_button('Register')
    end

    it 'form can be filled out' do 
      fill_in('Name:', with: 'John Jacob Jingleheimer Schmidt')
      fill_in('Email:', with: 'jjjs@gmail.com')
      click_button 'Register' 
      expect(current_path).to_not eq('/register')
      # expect(page).to have_content('John Jacob Jingleheimer Schmidt') 
    end
    
    it 'if email validation fails, try again' do 
      user_1 = create(:user)
      fill_in('Name:', with: 'John Jacob Jingleheimer Schmidt')
      fill_in('Email:', with: user_1.email)
      click_button 'Register'
      expect(current_path).to eq('/register')
      save_and_open_page
      # within ("#error_explanation") do
        expect(page).to have_content('Email has already been taken')
      # end
    end
end

# When a user visits the '/register' path they should see a form to register.

# The form should include:

#  Name
#  Email (must be unique)
#  Register Button
# Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.