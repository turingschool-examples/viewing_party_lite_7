module ApplicationHelper

  def format_runtime(runtime)
    hours = runtime.div(60)
    minutes = runtime % 60
    "#{hours}h #{minutes}m"
  end

  def format_genres(genres)
    genres.to_sentence(last_word_connector: ', ')
  end

  def count_reviews(reviews)
    reviews.count
  end

  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  def format_time(time)
    time.strftime("%l:%M %p").strip
  end
end
