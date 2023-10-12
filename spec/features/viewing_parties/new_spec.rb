require "rails_helper"

RSpec.feature "Viewing Party New" do
  before do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)
  end
  xit "displays form" do
    load_test_data

    visit "/users/#{@cindy.id}/movies/15102/viewing_parties/new"
    save_and_open_page
  end

  it "creates viewing parties with attributes" do
    load_test_data

    visit "/users/#{@cindy.id}/movies/15102/viewing_parties/new"
    
    click_button "Create Party"
    
    expect(page).to have_content("Endgame")
    
  end

  xit "creates viewing parties with others invited" do
    load_test_data

    visit "/users/#{@cindy.id}/movies/15102/viewing_parties/new"
    
    click_button "Create Party"
    save_and_open_page

    expect(page).to have_content("blah")
    
  end
end

# <% @users.each do |user| %>
#   <%= f.label :invites, "#{user.name} (#{user.email})" %>
#   <%= f.check_box_tag "users[]", user.id, checked: true %></br>
#   <% end %>