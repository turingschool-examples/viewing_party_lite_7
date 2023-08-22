require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before do
    @user_1 = User.create #however we create using factorybot, or something
    @user_2 = User.create #however we create using factorybot, or something
    @user_3 = User.create #however we create using factorybot, or something
    visit root_path
  end

  it "shows the Application Title" do
    within("#header") do
      expect(page).to have_content('Viewing Party')
    end
  end

  xit "has a button to create a new user" do
    within("#new-user-button") do
      expect(page).to have_button('Create a New User')
      click_on 'Create a new user'
    end

    expect(current_path).to eq(register_path)
  end

  xit "lists all existing users" do
    within("#user-list") do
      expect(page).to have_content('Existing Users')
      expect(page).to have_content(@user_1.email, @user_2.email, @user_3.email)
      within("#user-#{user_1.id}") do
        click_link "#{@user_1.email}"
      end
    end
    expect(current_path).to eq(user_path(user_1))
  end

  xit "has a link to the root page" do
    expect(page).to have_link('Home', href: root_path)
  end
end