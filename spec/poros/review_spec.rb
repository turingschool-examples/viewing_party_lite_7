require "rails_helper"

RSpec.describe Review do
  it "has an author, rating, and full comments" do
    review = Review.new({
      "author": "CinemaSerf",
      "author_details": {
          "name": "CinemaSerf",
          "username": "Geronimo1967",
          "avatar_path": "/1kks3YnVkpyQxzw36CObFPvhL5f.jpg",
          "rating": 8.0
      },
      "content": "This is a seriously creepy affair that follows the story of the young \"Franzis\" (Friedrich Feher) who goes to a fairground one night with his friend \"Alan\" (Hans Heinrich von Twardowski). They happen upon the performance of the coffin-dwelling somnambulist prophesier \"Cesare\" (Conrad Veidt) and his spooky master \"Dr. Caligari\" (Werner Krauss). \"Casare\" - who is all but skeletal in appearance, portends looming disaster for \"Alan\", and when he is found murdered next morning suspicions turn to this enigmatic pair- even though there is no real \"evidence\" at all! Things take an even darker twist when the anaemic seer predicts that \"Jane\" (Lil Dagover), a gentle creature admired by both the deceased and his surviving friend, is not long for this mortal coil either... It falls to \"Franzis\" to solve the mystery and save his love from... The story is bleak at times, the settings stark and angular, frequently almost abstract in appearance. Veidt is outstanding, as if he were in a nightmare in an Escher drawing, or some other such challenging structure for our minds to comprehend; and Krauss, too, with his maniacal eyes and almost orchestra leading hand gestures is wonderful too. The photography has a tendency to draw out the shots a little too much, but again - they help create a genuine sense of scariness. Nothing gory, or bloody - just eerie, and enormously effective. Unlike so many films that have attained critical acclaim, or cult status, this is actually a really good story with strong acting talent and wonderfully vivid visuals from Robert Wiene (and Willy Hameister) that really is amongst the best of it's - or any other - genre..",
      "created_at": "2022-06-06T16:37:01.950Z",
      "id": "629e2d2d65e0a25509808f9f",
      "updated_at": "2022-06-06T16:37:01.950Z",
      "url": "https://www.themoviedb.org/review/629e2d2d65e0a25509808f9f"
    })

    expect(review).to be_a(Review)
    expect(review.author).to eq("CinemaSerf")
    expect(review.rating).to eq(8.0)
    expect(review.comments).to eq("This is a seriously creepy affair that follows the story of the young \"Franzis\" (Friedrich Feher) who goes to a fairground one night with his friend \"Alan\" (Hans Heinrich von Twardowski). They happen upon the performance of the coffin-dwelling somnambulist prophesier \"Cesare\" (Conrad Veidt) and his spooky master \"Dr. Caligari\" (Werner Krauss). \"Casare\" - who is all but skeletal in appearance, portends looming disaster for \"Alan\", and when he is found murdered next morning suspicions turn to this enigmatic pair- even though there is no real \"evidence\" at all! Things take an even darker twist when the anaemic seer predicts that \"Jane\" (Lil Dagover), a gentle creature admired by both the deceased and his surviving friend, is not long for this mortal coil either... It falls to \"Franzis\" to solve the mystery and save his love from... The story is bleak at times, the settings stark and angular, frequently almost abstract in appearance. Veidt is outstanding, as if he were in a nightmare in an Escher drawing, or some other such challenging structure for our minds to comprehend; and Krauss, too, with his maniacal eyes and almost orchestra leading hand gestures is wonderful too. The photography has a tendency to draw out the shots a little too much, but again - they help create a genuine sense of scariness. Nothing gory, or bloody - just eerie, and enormously effective. Unlike so many films that have attained critical acclaim, or cult status, this is actually a really good story with strong acting talent and wonderfully vivid visuals from Robert Wiene (and Willy Hameister) that really is amongst the best of it's - or any other - genre..")
  end
end