class ConcertsController < ApplicationController

	def index
	    @client = Grooveshark::Client.new
	    remote = Songkickr::Remote.new 'O0j5D0jtgZ4BuWhj'
	    if params[:query]
	    	@songs = @client.search_songs(params[:query])
	    else
	    	metro_area = remote.location_search_geo(49.1811,-0.3712, :per_page => 1).results
	    	metro_area_id = 'sk:' + metro_area.shift.metro_area.id.to_s
	    	today = Time.new.strftime("%Y-%m-%d")
	    	today_next_year = (Time.new + 1.years).strftime("%Y-%m-%d")
	    	@concerts = remote.events(:location => metro_area_id, :per_page => '50', :min_date => today, :max_date => today_next_year, :page => 1).results
	    	@concerts.delete_if{|c| c.popularity < 0.001}
	    	@hash_widget = Hash.new
	    	@concerts.each do |c|
	    		artist_name = c.performances.shift.display_name
	    		songs = @client.search_songs(artist_name)
	    		songs.delete_if{|s| ! s.artist.eql? artist_name}
	    		songs = songs.first 5
	    		@hash_widget[c.id] = songs
	    	end

	    end
  	end
end
