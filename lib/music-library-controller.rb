class MusicLibraryController

	def initialize(path = './db/mp3s')
		MusicImporter.new(path).import
	end

	def call
		# list_artists if gets == "list artists"
		# # puts Song.all if user_input == "list_songs"
		case gets
			when "list songs"
				list_songs
			when "list artists"
				list_artists
			when "list genres"
				list_genres
			when "exit"
				"break"
			else
				puts "Wrong Input"
		end
	end

	def list_songs
		Song.all.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.artist} - #{song.genre}"}
	end

	def list_artists
		Song.all.each.with_index(1) {|artist, index| puts "#{index}. #{artist.name}" }
		
	end

end

# 	def listsg
#     self.new
# 	end

# end




# list_songs
# list_artists
# list_genres
