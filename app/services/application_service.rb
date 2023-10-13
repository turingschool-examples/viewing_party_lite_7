# frozen_string_literal: true

# app/services/application_service.rb
class ApplicationService
  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
