require 'rails_helper'

RSpec.describe 'User index page' do
    it 'displays title of application' do
        visit(root_path)
        expect(page).to have_content('Viewing Party Lite')
    end

    it 'displays a link to go back to the landing page' do
        visit(root_path)
        expect(page).to have_link('Home', href: root_path)
    end

    it 'displays a button to create a new user' do
        visit(root_path)
        expect(page).to have_link('Create New User', href: register_path)
    end

    it 'displays a list of existing users' do
        @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')
        @user2 = User.create(name: 'Bob', email: 'bobiscool@yahoo.com')
        @user3 = User.create(name: 'Karen', email: 'karenisalright@yahoo.com')
        visit(root_path)
        save_and_open_page

        expect(page).to have_content(@user1.name)
        expect(page).to have_content(@user2.name)
        expect(page).to have_content(@user3.name)
    end
end