class PreviewFacade
  attr_reader :url

  def initialize(query_params)
    @query = query_params
  end

  def movie_previews
    service = MovieService.new
    json = service.return_results(@query)
    json[:results].map do |preview_data|
      Preview.new(preview_data)
    end
  end
end
