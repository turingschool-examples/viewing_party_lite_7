class PreviewFacade
  def self.discover_results
    service = MovieService.new
    json = service.discover
    json[:results].map do |preview_data|
      Preview.new(preview_data)
    end
  end
  # def self.search_results(movie_title)
  #   service = MovieService.new
  #   json = service.search(movie_title)
  #   json[:results].map do |preview_data|
  #     Preview.new(preview_data)
  #   end
  # end
end
