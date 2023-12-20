require "rails_helper"

RSpec.describe "New Party" do
  before :each do
    test_data
  end

  it "can create a new party with all attributes", :vcr do
    visit "/login"

    fill_in :email, with: "Bungie123@gmail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"

    visit "/movies/808"

    click_button "Create Viewing Party for Shrek"
    expect(current_path).to eq("/movies/808/viewing-party/new")
    
    expect(page).to have_content("Create a Movie Party for Shrek")
    expect(page).to have_button("Discover Page")
    expect(page).to have_content("Viewing Party Details")
    expect(page).to have_content("Movie Title")
    expect(page).to have_content("Shrek")
    expect(page).to have_content("Duration of Party")
    expect(find_field(:duration).value).to eq("90")
    expect(page).to have_content("Day")
    expect(page).to have_content("Start Time")
    expect(page).to have_content("Invite Other Users")
    
    expect(page).to have_content("#{@user2.name} (#{@user2.email})")
    expect(page).to have_content("#{@user3.name} (#{@user3.email})")
    
    fill_in :duration, with: 100
    
    select "2024", from: "_day_1i"
    select "February", from: "_day_2i"
    select "1", from: "_day_3i"  
    
    select "19", from: "_time_4i"
    select "00", from: "_time_5i"
    
    expect(find_field("_day_1i").value).to eq("2024")
    page.check "#{@user3.id}"
    
    click_button "Create Party"
    
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("#{@user1.name}")
    expect(page).to have_content("Shrek")
    expect(page).to have_content("February 1, 2024")
    expect(page).to have_content("7:00 pm")
    expect(page).to have_content("Hosting")
    visit "/login"

    fill_in :email, with: "#{@user3.email}"
    fill_in :password, with: "Hello123!"

    click_on "Log In"
    visit "/dashboard"
    expect(page).to have_content("#{@user3.name}")
    expect(page).to have_content("Shrek")
    expect(page).to have_content("February 1, 2024")
    expect(page).to have_content("7:00 pm")
    expect(page).to have_content("Invited")
    visit "/login"

    fill_in :email, with: "#{@user2.email}"
    fill_in :password, with: "Hello123!"

    click_on "Log In"
    visit "/dashboard"
    expect(page).to have_content("#{@user2.name}")
    expect(page).to_not have_content("Shrek")
  end

  it "cannot create a viewing party without logging in first", :vcr do
    visit "/movies/808/viewing-party/new"
    
    expect(current_path).to eq("/")
    
    visit "/login"

    fill_in :email, with: "Bungie123@gmail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"

    

    visit "/dashboard"

    expect(page).to have_content("#{@user1.name}")
    expect(page).to_not have_content("Shrek")
    expect(page).to_not have_content("February 1, 2024")
    expect(page).to_not have_content("7:00 pm")
    expect(page).to_not have_content("Hosting")

    click_on("Log out")
    visit "/login"

    fill_in :email, with: "#{@user3.email}"
    fill_in :password, with: "Hello123!"

    click_on "Log In"

    expect(page).to have_content("#{@user3.name}")
    expect(page).to_not have_content("Shrek")
    expect(page).to_not have_content("February 1, 2024")
    expect(page).to_not have_content("7:00 pm")
    expect(page).to_not have_content("Invited")
    click_on("Log out")
    visit "/login"

    fill_in :email, with: "#{@user2.email}"
    fill_in :password, with: "Hello123!"

    click_on "Log In"

    expect(page).to have_content("#{@user2.name}")
    expect(page).to_not have_content("Shrek")
  end

  it "can will not create a party with a duration lower than the movie runtime", :vcr do
    visit "/login"

    fill_in :email, with: "Bungie123@gmail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"

    visit "/movies/808/viewing-party/new"

    fill_in :duration, with: 80


    select "2024", from: "_day_1i"
    select "February", from: "_day_2i"
    select "1", from: "_day_3i"  
    
    select "19", from: "_time_4i"
    select "00", from: "_time_5i"
    
    page.check "#{@user3.id}"

    click_button("Create Party")

    expect(current_path).to eq("/movies/808/viewing-party/new")

    expect(page).to have_content("Party Duration Must Be Longer Than Movie Runtime")

  end
  
  it "can will not create a party set in the past", :vcr do
    visit "/login"

    fill_in :email, with: "Bungie123@gmail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"

    visit "/movies/808/viewing-party/new"

    fill_in :duration, with: 100


    select "2022", from: "_day_1i"
    select "February", from: "_day_2i"
    select "1", from: "_day_3i"  
    
    select "19", from: "_time_4i"
    select "00", from: "_time_5i"
    
    click_button("Create Party")
    
    expect(current_path).to eq("/movies/808/viewing-party/new")

    expect(page).to have_content("Party Date Must Be Set in the Future")
  end

  it "Only creates a new db object if it doesn't exist", :vcr do
    visit "/login"

    fill_in :email, with: "Bungie123@gmail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"

    visit "/movies/808/viewing-party/new"
    
    select "2024", from: "_day_1i"
    
    click_button("Create Party")

    expect(Movie.where(tmdb_id: 808).count).to eq(1)
    
    visit "/movies/808/viewing-party/new"
    
    select "2024", from: "_day_1i"
    
    click_button("Create Party")

    expect(Movie.where(tmdb_id: 808).count).to eq(1)
  end
end