require "rails_helper"

RSpec.describe "Movies Show" do
  before :each do
    test_data 
  end

  it "It should have a button to create a viewing party and a button to return to the discover page", :vcr do
    visit "/users/#{@user1.id}/discover"

    fill_in :movie_title, with: "Shrek"
    click_button "Find Movies"
    click_link("Shrek", match: :first)
    expect(current_path).to eq("/users/#{@user1.id}/movies/808")
    
    expect(page).to have_button("Create Viewing Party for Shrek")
    click_button "Discover Page"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it "It should have Movie Title
  Vote Average of the movie
  Runtime in hours & minutes
  Genre(s) associated to movie
  Summary description
  List the first 10 cast members (characters&actress/actors)
  Count of total reviews
  Each review's author and information", :vcr do

    visit "/users/#{@user1.id}/movies/808"
    
    expect(page).to have_content("Shrek")
    expect(page).to have_content("Vote Average: 7.7")
    expect(page).to have_content("Runtime: 1hr 30min")
    expect(page).to have_content("Genre: Animation, Comedy, Fantasy, Adventure, Family")
    expect(page).to have_content("Summary: It ain't easy bein' green -- especially if you're a likable (albeit smelly) ogre named Shrek. On a mission to retrieve a gorgeous princess from the clutches of a fire-breathing dragon, Shrek teams up with an unlikely compatriot -- a wisecracking donkey.")
    expect(page).to have_content("Cast") 
    expect(page).to have_content("Mike Myers as Shrek / Blind Mouse / Opening Narration (voice)")
    expect(page).to have_content("Cameron Diaz as Princess Fiona (voice)")
    expect(page).to have_content("Peter Dennis as Ogre Hunter (voice)")
    expect(page).to have_content("Chris Miller as Geppetto / Magic Mirror (voice)")
  save_and_open_page
    expect(page).to have_content("4 Reviews") 
    expect(page).to have_content("GenerationofSwine: Eddie Murphy was actually funny in this. I mean he was 1980s Eddie Murphy style funny in this. It was like he was at the top of his game again.\r \r It makes you miss Eddie. What we have today is not the glory that he once was.\r \r But, beyond the great return of funny Eddie...there is a wonderful dark humor that goes great with an otherwise wholesome and moving moral.")
    expect(page).to have_content("CinemaSerf: Poor old ogre \"Shrek\" just want to be left alone, that's all - he's got a bit of the Greta Garbo's about him. Rather inconveniently, though, nasty Lord \"Farquaad\" who has a little of the Napoleon syndrome about him, banishes all the fairytale creatures from his lands and so they turn up on the doorstep of our green friend. How can he be rid of them all? Well together with his new (and frankly quite annoying friend) \"Donkey\" they head to the castle where they are given challenge: go and rescue the Princess \"Fiona\" from her dragon-guarded castle tower and bring her to marry the diminutive dictator. Off they go on a series of fun escapades that introduce us to all the creatures in the forest - including a decidedly French \"Robin Hood , \"Pinocchio\", \"Peter Pan\" - indeed, just about everyone from the fables pantheon. Do they achieve their mission - we you will just have to watch and see; but along the way the jokes have plenty to amuse older audiences with a screenplay that pokes some gentle fun at some prevailing stereotypes on beauty, loyalty, bullying, sexuality - you name it. Murphy is still fearsomely annoying - sorry, but Messrs. Myers, Lithgow and Cassel along with Cameron Diaz add richness to the punchy script and to the excellent and enjoyably colourful animation to create a film that has stood the test of time well.")


    
    

  end



end