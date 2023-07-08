class CreditFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def show_credits
    service = MovieService.new
    credit_data = service.movie_credits(@movie_id)
    @credits = Credit.new(credit_data)
  end
end
