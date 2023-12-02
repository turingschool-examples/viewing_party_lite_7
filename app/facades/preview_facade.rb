class PreviewFacade
  attr_reader :url

  def initialize(query_params)
    @query = query_params
  end

  def movie_previews
    json = @query != 'top_rated' ? MovieService.search_results(@query) : MovieService.discover_results
    json[:results].map do |preview_data|
      Preview.new(preview_data)
    end
  end
end
