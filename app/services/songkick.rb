class Songkick

  def initialize
    @remote = Songkickr::Remote.new 'O0j5D0jtgZ4BuWhj'
    @location = get_location(49.158611, -0.390833)
    @concerts = []
  end

  def concerts
    @concerts = @remote.events( location: @location, 
                                per_page: '50',
                                min_date: Date.today.to_s,
                                max_date: 1.year.from_now.to_date.to_s,
                                page: 1).results

    @concerts.delete_if{|c| c.popularity < 0.0008}
  end

  def get_location(lat, lon)
    metro_area = @remote.location_search_geo(lat,lon, per_page: 1).results
    return "sk:#{metro_area.shift.metro_area.id}"
  end

end