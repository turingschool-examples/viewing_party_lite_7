class Movies 
  attr_reader :name, 
              :vote_average, 
              :movie_id, 
              :genres, 
              :runtime, 
              :description, 
              :cast_members, 
              :count_of_reviews, 
              :author_information

  def initialize(info, cast_info, reviews_data)
    @name = info[:original_title] unless info[:original_title].nil?
    @vote_average = info[:vote_average] unless info[:vote_average].nil?
    @movie_id = info[:id] unless info[:id].nil?
    @genres = info[:genres]&.map { |genre| genre[:name]}
    @runtime = info[:runtime].divmod(60) unless info[:runtime].nil? 
    @description = info[:overview] unless info[:overview].nil?
    if cast_info
      @cast_members = {}
      cast_info[:cast]&.each { |member| @cast_members[member[:character]] = member[:original_name]}
      @cast_members = @cast_members.first(10).to_h
    end 
    @count_of_reviews = reviews_data&.[](:total_results)
    @author_information = author_hash(reviews_data) unless reviews_data.nil?

  end

    def author_hash(reviews_data)
      hash = {}
      reviews_data[:results].each do |review|
        hash[review[:author]] = review[:author_details]
      end
      return hash
    end
end