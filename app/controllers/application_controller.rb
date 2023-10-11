# app/controller/application_controller.rb
class ApplicationController < ActionController::Base
  def error_message(errors)
    errors.full_messages.join(', ')
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end

  def json_parse(connection)
    JSON.parse(connection.body, symbolize_names: true)
  end
end
