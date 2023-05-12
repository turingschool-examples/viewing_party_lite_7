class PartyFacade
  def self.create_party(params)
      Party.create!(duration: params[:duration].to_i,
                  movie_id: params[:movie_id],
                  date: self.format_date(params),
                  time: self.format_time(params))
  end

  def self.format_date(params)
    Date.parse("#{params["day(1i)"]}/#{params["day(2i)"]}/#{params["day(3i)"]}").to_fs(:long)
  end

  def self.format_time(params)
    Time.parse("#{params["time(4i)"]}:#{params["time(5i)"]}").strftime("%-l:%M %P")
  end


end