require 'rails_helper'

describe MovieService do
    context "instance methods" do
        context "#top_rated" do
            it "returns top rated movies", :vcr do
                discover = MovieService.new.top_rated

                expect(discover).to be_a Hash
                expect(discover[:results]).to be_an Array

                movie = discover[:results].first

                expect(movie).to have_key :title
                expect(movie[:title]).to be_a(String)
        
                expect(movie).to have_key :original_title
                expect(movie[:original_title]).to be_a(String)
        
                expect(movie).to have_key :overview
                expect(movie[:overview]).to be_a(String)
        
                expect(movie).to have_key :popularity
                expect(movie[:popularity]).to be_a(Float)
            end
        end

        context "#movie_query" do
            it "returns 20 movies from a keyword query", :vcr do
                discover = MovieService.new.movie_query("Holiday")

                expect(discover).to be_a Hash
                expect(discover[:results]).to be_an Array

                movie = discover[:results].first

                expect(movie).to have_key :title
                expect(movie[:title]).to be_a(String)
        
                expect(movie).to have_key :original_title
                expect(movie[:original_title]).to be_a(String)
        
                expect(movie).to have_key :overview
                expect(movie[:overview]).to be_a(String)
        
                expect(movie).to have_key :popularity
                expect(movie[:popularity]).to be_a(Float)
            end
        end

        context "#movie_details" do
            it "returns details of one specific movie", :vcr do
                discover = MovieService.new.top_rated
                movie = discover[:results][0]
                movie_id = movie[:id]
                movie_details = MovieService.new.movie_details(movie_id)

                expect(movie_details).to be_a Hash

                expect(movie_details).to have_key :title
                expect(movie_details[:title]).to be_a(String)
        
                expect(movie_details).to have_key :vote_average
                expect(movie_details[:vote_average]).to be_a(Float)

                expect(movie_details).to have_key :runtime
                expect(movie_details[:runtime]).to be_an(Integer)
        
                expect(movie_details).to have_key :genres
                expect(movie_details[:genres]).to be_an(Array)
        
                expect(movie_details).to have_key :overview
                expect(movie_details[:overview]).to be_an(String)
            end
        end

        context "#cast_members" do
            it "returns a specific movie's cast members and their details", :vcr do
                discover = MovieService.new.top_rated
                movie = discover[:results][0]
                movie_id = movie[:id]
                cast_members = MovieService.new.cast_members(movie_id)

                expect(cast_members).to be_a Hash
                expect(cast_members[:cast]).to be_an Array

                member_1 = cast_members[:cast].first

                expect(member_1).to have_key :name
                expect(member_1[:name]).to be_a(String)

                expect(member_1).to have_key :character
                expect(member_1[:character]).to be_a(String)
            end
        end

        context "#reviews" do
            it "returns a specific movie's reviews and their details", :vcr do
                discover = MovieService.new.top_rated
                movie = discover[:results][0]
                movie_id = movie[:id]
                reviews = MovieService.new.reviews(movie_id)
                
                expect(reviews).to be_a Hash
                expect(reviews[:results]).to be_an Array

                review_1 = reviews[:results].first

                expect(reviews[:total_results]).to be_an(Integer)

                expect(review_1).to have_key :author
                expect(review_1[:author]).to be_a(String)

                expect(review_1).to have_key :author_details
                expect(review_1[:author_details]).to be_a(Hash)
            end
        end
    end
end