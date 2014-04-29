class ConcertsController < ApplicationController

	def index
	    @client = Grooveshark::Client.new
	    if params[:query]
	    	@songs = @client.search_songs(params[:query])
	    else
	    	@concerts = Songkick.new.concerts
	    	@hash_widget = Hash.new
	    	@concerts.each do |c|
	    		artist_name = c.performances.shift.display_name
	    		songs = @client.search_songs(artist_name)
	    		songs.delete_if{|s| ! s.artist.eql? artist_name}
	    		songs = songs.first 5
	    		@hash_widget[c.id] = songs
	    	end
	    	@concerts.delete_if{|c| @hash_widget[c.id].empty? }
	    end
  	end
end
