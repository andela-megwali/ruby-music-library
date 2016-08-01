class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
    welcome_message
  end

	def welcome_message
	   puts "Welcome to the music library"
	   puts "Below is a list of commands to perform actions in the library:"
	   puts "*****************************************************************"
	   puts "1. 'list songs'"
	   puts "Lists all the songs in the music library"
	   puts "2. 'list artists'"
	   puts "Lsts all the artists whose songs are in the music library"
	   puts "3. 'list genres'"
	   puts "Lists all the song genres available in the music library"
	   puts "4. 'play song'"
	   puts "Lists all songs in the library and plays any selected song number"
	   puts "5. 'list artist'"
	   puts "Lists all songs with corresponding genre of any selected artist"
	   puts "6. 'list genre'"
	   puts "Lists all songs with corresponding artist in any selected genre"
	   puts "7. 'exit'"
	   puts "Exits the music library"
	   puts "*****************************************************************"
	end

  def call(x= gets.chomp.downcase)
# 		@user_input = {
# 		"list songs" => :list_songs,
# 		"list artists" => :list_artists,
# 		"list genres" => :list_genres,
# 		"play song" => :play_song,
# 		"list artist" => :list_artist,
# 		"list genre" => :list_genre
# }

#   @user_input[x]
 # binding.pry
#call if x != "exit"


# a = ["list songs", "list artists", "list genres", "play song", "list artist", "list genre"]
# b = [list_songs, list_artists, list_genres, play_song, list_artist, list_genre]
# puts a

# a.each_with_index {|user_input, index| b[index] if user_input == x}

#    puts "New Command"
    case x
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "exit"
        return "exiting"
      else
        puts "#{x} is an unrecognised input. Try again with a valid command"
    end
    call
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre, index|
    	puts "#{index}. #{genre.name}"
    end
  end

  def play_song#(x= gets.chomp.to_i)
  	list_songs
  	puts "Type a song number to play the related song"
    play = Song.all[gets.chomp.to_i-1] 
    puts "Playing #{play.artist.name} - #{play.name} - #{play.genre.name}"
  end

  def list_artist#(x= gets.chomp)
  	list_artists
  	puts "Type the name of any listed artist"
  	x= gets.chomp
    c = Artist.all.detect {|artist| artist.name == x}
    c.songs.each do |song|
      puts "#{c.name} - #{song.name} - #{song.genre.name}"
    end
   end

	def list_genre#(x= gets.chomp)
		list_genres
		puts "Type the name of any listed genre"
		x= gets.chomp
		c = Genre.all.detect {|genre| genre.name == x}
		c.songs.each do |song|
			puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end
  
  def exit_now
  	return "exit"
  end
end