require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
    describe "As a user" do
        describe 'When I visit the welcome page' do
            it 'Has a title, button to register an account, and a link back to this page' do

                visit root_path

                expect(page).to have_content("Viewing Party")
                expect(page).to have_button("Create an account")
                expect(page).to have_link("Viewing Party Home")

                click_button "Create an account"

                expect(current_path).to eq(register_path)
            end

            it 'Has a list of currently registered users' do
            
                create_list(:user, 3)
                users = User.all
                @user_1 = users[0]
                @user_2 = users[1]
                @user_3 = users[2]
                
                visit root_path

                within "#user_#{@user_1.id}" do
                    expect(page).to have_link("#{@user_1.name}")
                    click_link "#{@user_1.name}"
                    expect(current_path).to eq("/users/#{@user_1.id}")
                end

                visit root_path

                within "#user_#{@user_2.id}" do
                    expect(page).to have_link("#{@user_2.name}")
                    click_link "#{@user_2.name}"
                    expect(current_path).to eq("/users/#{@user_2.id}")
                end

                visit root_path

                within "#user_#{@user_3.id}" do
                    expect(page).to have_link("#{@user_3.name}")
                    click_link "#{@user_3.name}"
                    expect(current_path).to eq("/users/#{@user_3.id}")
                end
            end
        end
    end
end