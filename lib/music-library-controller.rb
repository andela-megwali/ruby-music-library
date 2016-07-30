class MusicLibraryController

	def initialize(path = './db/mp3s')
		MusicImporter.new(path).import
	end

	def call(x= gets)
		# case x
		# 	when "list songs"
		# 		list_songs
		# 	when "list artists"
		# 		list_artists
		# 	when "list genres"
		# 		list_genres
		# 	when "play song"
		# 		play_song
		# 	when "list artist"
		# 		list_artist
		# 	when "list genre"
		# 		list_genre
		# 	when "exit"
		# 		return "exiting"
		# 	else
		# 		puts "#{x} = Unrecognised Input"
		# end
		# call
		user_input[x]
	end

	def list_songs
		Song.all.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
	end

	def list_artists
		Artist.all.each.with_index(1) {|artist, index| puts "#{index}. #{artist.name}"}	
	end

	def list_genres
		Genre.all.each.with_index(1) {|genre, index| puts "#{index}. #{genre.name}" }	
	end

	def play_song(x= gets.to_i)
		now_playing = Song.all[x-1]
		puts "Playing #{now_playing.artist.name} - #{now_playing.name} - #{now_playing.genre.name}"
	end

	def list_artist(x= gets)
		c = Artist.all.detect {|artist| artist.name == x}
		c.songs.each {|song| puts "#{c.name} - #{song.name} - #{song.genre.name}"}
	end

	def list_genre(x= gets)
		c = Genre.all.detect {|genre| genre.name == x}
		c.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
	end

end

user_input = {
	"list songs" => list_songs,
	"list artists" => list_artists,
	"list genres" => list_genres,
	"play song" => play_song,
	"list artist" => list_artist,
	"list genre" => list_genre
			# when "exit"
			# 	return "exiting"
			# else
			# 	puts "#{x} = Unrecognised Input"
}

