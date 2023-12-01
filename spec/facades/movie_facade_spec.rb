require "rails_helper"

RSpec.describe MovieFacade do
  
  it "#movie_make", :vcr do
    movie = MovieFacade.new(808)
    expect(movie).to be_a(MovieFacade)
    expect(movie.movie).to be_a(MovieData)
    expect(movie.movie.id).to eq(808)
    expect(movie.movie.title).to eq("Shrek")
    expect(movie.movie.runtime).to eq(90)
    expect(movie.movie.vote_average).to eq(7.731)
    expect(movie.movie.genre).to eq("Animation, Comedy, Fantasy, Adventure, Family")
    expect(movie.movie.summary).to eq("It ain't easy bein' green -- especially if you're a likable (albeit smelly) ogre named Shrek. On a mission to retrieve a gorgeous princess from the clutches of a fire-breathing dragon, Shrek teams up with an unlikely compatriot -- a wisecracking donkey.")
    expect(movie.movie.credits).to eq(
      {"Mike Myers"=>"Shrek / Blind Mouse / Opening Narration (voice)",
      "Eddie Murphy"=>"Donkey (voice)",
      "Cameron Diaz"=>"Princess Fiona (voice)",
      "John Lithgow"=>"Lord Farquaad (voice)",
      "Vincent Cassel"=>"Monsieur Hood (voice)",
      "Peter Dennis"=>"Ogre Hunter (voice)",
      "Clive Pearse"=>"Ogre Hunter (voice)",
      "Jim Cummings"=>"Captain of Guards (voice)",
      "Bobby Block"=>"Baby Bear (voice)",
      "Chris Miller"=>"Geppetto / Magic Mirror (voice)"})
    expect(movie.movie.reviews).to eq(
      [["Cwf97",
      "Shrek is a masterpiece! It helped subvert the Disney Renaissance formula with great humor and heart. Myers, Murphy, Diaz and Lithgow did a great job voicing the characters. Now that this film is 20 years old, I am glad it existed."],
     ["GenerationofSwine",
      "Eddie Murphy was actually funny in this. I mean he was 1980s Eddie Murphy style funny in this. It was like he was at the top of his game again.\r\n\r\nIt makes you miss Eddie. What we have today is not the glory that he once was.\r\n\r\nBut, beyond the great return of funny Eddie...there is a wonderful dark humor that goes great with an otherwise wholesome and moving moral."],
     ["핸키", "It was so fun and a new try. 하하"],
     ["CinemaSerf", "Poor old ogre \"Shrek\" just want to be left alone, that's all - he's got a bit of the Greta Garbo's about him. Rather inconveniently, though, nasty Lord \"Farquaad\" who has a little of the Napoleon syndrome about him, banishes all the fairytale creatures from his lands and so they turn up on the doorstep of our green friend. How can he be rid of them all? Well together with his new (and frankly quite annoying friend) \"Donkey\" they head to the castle where they are given challenge: go and rescue the Princess \"Fiona\" from her dragon-guarded castle tower and bring her to marry the diminutive dictator. Off they go on a series of fun escapades that introduce us to all the creatures in the forest - including a decidedly French \"Robin Hood , \"Pinocchio\", \"Peter Pan\" - indeed, just about everyone from the fables pantheon. Do they achieve their mission - we you will just have to watch and see; but along the way the jokes have plenty to amuse older audiences with a screenplay that pokes some gentle fun at some prevailing stereotypes on beauty, loyalty, bullying, sexuality - you name it. Murphy is still fearsomely annoying - sorry, but Messrs. Myers, Lithgow and Cassel along with Cameron Diaz add richness to the punchy script and to the excellent and enjoyably colourful animation to create a film that has stood the test of time well."]]
    )
    expect(movie.movie.review_count).to eq(4)
  end

  it "::top_movies", :vcr do
    top_movies = MovieFacade.top_movies
    expect(top_movies).to be_a(Hash)
    top_movies.each do |movie|
      expect(movie[0]).to be_a(String)
      expect(movie[1]).to be_a(Array)
      expect(movie[1][0]).to be_a(Float)
      expect(movie[1][1]).to be_a(Integer)
    end
  end

  it "::search", :vcr do
    search_results = MovieFacade.search("Princess")
    expect(search_results).to be_a(Hash)
    search_results.each do |movie|
      expect(movie[0]).to be_a(String)
      expect(movie[1]).to be_a(Array)
      expect(movie[1][0]).to be_a(Float)
      expect(movie[1][1]).to be_a(Integer)
    end
  end
end