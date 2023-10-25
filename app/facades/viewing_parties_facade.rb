# frozen_string_literal: true

class ViewingPartiesFacade
  attr_reader :movie_id,
              :user,
              :duration,
              :runtime,
              :date,
              :start_time,
              :params

  def initialize(params)
    @movie_id = params[:movie_id]
    @user = User.find(params[:user_id])
    @duration = params[:duration]
    @runtime = params[:runtime]
    @date = params[:date]
    @start_time = params[:start_time]
    @params = params
  end

  def movie
    movie = ThemoviedbService.new.movie_details(@movie_id)
    MovieDetails.new(movie)
  end

  def duration_less_than_runtime
    @duration.to_i < @runtime.to_i
  end

  def create_user_viewing_party
    party = ViewingParty.create!(
      duration: @duration,
      date: @date,
      start_time: @start_time,
      movie_id: @movie_id,
      host_user_id: @user.id
    )

    User.all.map do |user|
      UserViewingParty.create!(user_id: user.id, viewing_party_id: party.id) if @params[user.id.to_s] == '1'
    end
  end
end
