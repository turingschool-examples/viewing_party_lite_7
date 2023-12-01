class DiscoverFacade
  def self.top_rated_movies
    service = MovieService.new
    json = service.discover
    json[:results].map do |preview_data|
      Preview.new(preview_data)
    end
  end
end
