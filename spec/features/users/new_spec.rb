require 'rails_helper'

RSpec.describe "user registration page" do
  before :each do
    User.delete_all
    # visit register_path
    visit "/register"
  end
  
  describe "initial testing" do
    it "exists and has a registration form" do
      expect(page).to have_field("Name:")
      expect(page).to have_field("Email:")
      expect(page).to have_field("Password:")
      expect(page).to have_field("Type your password again:")
      expect(page).to have_button("Create New User")
    end
    
    it "takes input to create a new user" do
      fill_in("Name:", with: "Jean-Luc Picard")
      fill_in("Email:", with: "captain@uss-enterprise.com")
      fill_in("Password:", with: "IamCaptain!")
      fill_in("Type your password again:", with: "IamCaptain!")

      click_on("Create New User")

      # expect(current_path).to eq("/users/#{User.last.id}")
      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Jean-Luc Picard has been created!")
    end
    
    # it "won't create a user with an already used email" do
    #   User.create(name: "William Riker", email: "number2@uss-enterprise.com", password: "IamNumber2")
      
    #   fill_in('Name', with: "William Riker")
    #   fill_in('Email', with: "number2@uss-enterprise.com")
    #   fill_in("Password:", with: "IamNumber2")
    #   fill_in("Type your password again:", with: "IamNumber2")

    #   click_on("Create New User")

    #   expect(current_path).to eq(register_path)
    #   expect(page).to have_content("Email has already been taken")
    # end
    
    describe "sad path testing" do
      it "won't create a user with an already used email" do
        User.create(name: "William Riker", email: "number2@uss-enterprise.com", password: "IamNumber2")
        
        fill_in('Name', with: "William Riker")
        fill_in('Email', with: "number2@uss-enterprise.com")
        fill_in("Password:", with: "IamNumber2")
        fill_in("Type your password again:", with: "IamNumber2")
  
        click_on("Create New User")
  
        # expect(current_path).to eq(register_path)
        expect(current_path).to eq("/register")
        expect(page).to have_content("Email has already been taken")
      end

      it "won't create a user with fields are blank" do
        click_on("Create New User")
        
        # expect(current_path).to eq(register_path)
        expect(current_path).to eq("/register")
        expect(page).to have_content("Name can't be blank, Email can't be blank, and Password can't be blank")
      end
      
      it "won't create a user if password_confirmation is invalid" do
        fill_in('Name', with: "Data")
        fill_in('Email', with: "data@uss-enterprise.com")
        fill_in("Password:", with: "IamData?")
        fill_in("Type your password again:", with: "wrong-password")
  
        click_on("Create New User")
  
        # expect(current_path).to eq(register_path)
        expect(current_path).to eq("/register")
        expect(page).to have_content("Password confirmation doesn't match Password")
      end

      it "won't create a user if password_confirmation is nil" do
        fill_in('Name', with: "Data")
        fill_in('Email', with: "data@uss-enterprise.com")
        fill_in("Password:", with: "IamData?")
        fill_in("Type your password again:", with: nil)
  
        click_on("Create New User")
  
        # expect(current_path).to eq(register_path)
        expect(current_path).to eq("/register")
        expect(page).to have_content("Password confirmation doesn't match Password")
      end

      # redundant tests, not needed: 
      # it "won't create a user without an email" do
      #   fill_in('Name', with:  "William Riker")
      #   click_on("Create New User")
        
      #   expect(current_path).to eq(register_path)
      #   expect(page).to have_content("Email can't be blank")
      #   expect(page).to_not have_content("Name can't be blank")
      # end
      
      # it "won't create a user without a name" do
      #   fill_in('Email', with: "JurassicSnark@jp.com")
      #   click_on("Create New User")
        
      #   expect(current_path).to eq(register_path)
      #   expect(page).to have_content("Name can't be blank")
      #   expect(page).to_not have_content("Email can't be blank")
      # end
    end
  end
end

