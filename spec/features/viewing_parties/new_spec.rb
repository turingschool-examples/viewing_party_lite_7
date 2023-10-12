require "rails_helper"

RSpec.feature "Viewing Party New" do
  before do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)
  end
  xit "shows up" do
    load_test_data

    visit "/users/#{@anne.id}/movies/49012/viewing_parties/new"
    save_and_open_page
  end
  it "shows up" do
    load_test_data

    visit "/users/#{@anne.id}/movies/49012/viewing_parties/new"
    
    click_button "Create Party"
    save_and_open_page

    expect(page).to have_content("blah")
    
  end
end

# <% @users.each do |user| %>
#   <%= f.label :invites, "#{user.name} (#{user.email})" %>
#   <%= f.check_box_tag "users[]", user.id, checked: true %></br>
#   <% end %>