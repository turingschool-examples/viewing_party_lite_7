class Movies 
  attr_reader :name, 
              :vote_average, 
              :movie_id, 
              :genres, 
              :runtime, 
              :description, 
              :cast_members, 
              :count_of_reviews, 
              :author_information, 
              :raw_runtime

  def initialize(info)
    @name = info[:original_title]
    @vote_average = info[:vote_average]
    @movie_id = info[:id]
    @genres = info[:genres]&.map { |genre| genre[:name]}
    @raw_runtime = info[:runtime]
    @runtime = info[:runtime].divmod(60)
    @description = info[:overview]
    @cast_members = get_cast(info[:cast])
    @count_of_reviews = info[:total_results]
    @author_information = author_hash(info[:results])
  end

  def get_cast(cast_info)
    hash = {}
    cast_info.each do |indiv|
      hash[indiv[:name]] = indiv[:character]
    end
    return hash.first(10).to_h
  end

  def author_hash(reviews_data)
    hash = {}
    reviews_data.each do |review|
      hash[review[:author]] = review[:author_details]
    end
    return hash
  end
end