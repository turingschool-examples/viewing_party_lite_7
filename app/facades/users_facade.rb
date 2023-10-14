class UsersFacade
  attr_reader :id,
              :user

  def initialize(user_params)
    @id = user_params[:id]
    @user = User.find(@id)
  end

  def invited_viewing_parties
    @user.viewing_parties
  end

  def hosted_viewing_parties
    ViewingParty.where(host_user_id: @id)
  end

  def party_movie(id)
    movie_info = ThemoviedbService.new.movie_details(id)
    MovieDetails.new(movie_info)
  end

  def poster_url(id)
    ThemoviedbService.new.poster_image_base_url[:base_url] + ThemoviedbService.new.poster_image_base_url[:logo_sizes][1] + invited_party_movie(id).poster_path
  end
end