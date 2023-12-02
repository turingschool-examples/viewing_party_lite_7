class PreviewFacade
  attr_reader :url

  def initialize(query_params)
    @query = query_params
  end

  def movie_previews
    service = MovieService.new
    json = @query != 'top_rated' ? service.search_results(@query) : service.discover_results
    json[:results].map do |preview_data|
      Preview.new(preview_data)
    end
  end
end
