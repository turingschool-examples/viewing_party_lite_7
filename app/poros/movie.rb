class Movie 
  attr_reader :id,
              :title,
              :vote_average

  def initialize(params)
    @id = params[:id]
    @title = params[:original_title]
    @vote_average = params[:vote_average]
  end

  def get_details(details) #make detail dummy in test
    details_hash = {}

     details_hash[:movie_title] = details[:original_title]
     details_hash[:vote_average] = details[:vote_average]
     details_hash[:runtime] = details[:runtime]
     details_hash[:genre] = get_genre(details[:genres])
     details_hash[:summary] = details[:overview]
     details_hash[:id] = details[:id]

    details_hash
  end

  def get_reviews(reviews)
    reviews_hash = {}

    reviews_hash[:review_count] = reviews[:total_results]
    reviews_hash[:author_info] = author_and_info(reviews[:results])
    
    reviews_hash
  end

  def get_credits(credits)
    first_10_cast = credits[:cast][0..9] 
    cast_info_hash = {}

    first_10_cast.map do |hash| 
      cast_info_hash[hash[:name]] = hash[:character]
    end
    cast_info_hash
  end

  def author_and_info(author_info)
    author_info_hash = {}

    author_info.each do |results|
      author_info_hash[results[:author]] = results[:author_details]
    end
    author_info_hash  
  end

  def get_genre(genre_hash) #stub in test
    genre_hash.map do |genre| 
      genre[:name]
    end.join(", ")
  end
end