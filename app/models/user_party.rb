class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  def host
    User.find(host_id)
  end

  def movie_poster_file_path
    @movie_facade = DetailedMovieFacade.new(self.party.movie_id)
    if @movie_facade.detailed_movie.poster_path.nil?
      @movie_poster_facade = MoviePosterFacade.new(1132679)
    else
      @movie_poster_facade = MoviePosterFacade.new(self.party.movie_id)
    end
    @movie_poster_facade.movie_poster.file_path
  end
end