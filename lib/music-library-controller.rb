class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
    welcome_message
    library_action_menu
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
#call if x != "exit"

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
        # puts "#{x} is an unrecognised input. Try again with a valid command"
        # welcome_message
        wrong_input(x)
    end
    new_command
  end

  # def exit_now
  # 	return "exit"
  # end
end

# b = x.gsub("list ", "")

def list_songs
    Song.all.each.with_index(1) {|song, index| list_songs_message(song, index)}
end

def list_songs_message(song, index)
	puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}".cyan
end

def list_artists
  Artist.all.each.with_index(1) do |artist, index|
    puts "#{index}. #{artist.name}".cyan
  end
end

def list_genres
  Genre.all.each.with_index(1) do |genre, index|
  	puts "#{index}. #{genre.name}".cyan
  end
end

def play_song
	list_songs
	puts "Type a song number to play the related song:".yellow
  play = Song.all[gets.chomp.to_i-1]
  puts ""
  puts "Playing #{play.artist.name} - #{play.name} - #{play.genre.name}".green
end

def list_artist
	list_artists
	puts "Type the name of any listed artist to list all their songs".yellow
  list_artist_songs(x= gets.chomp.gsub(/[A-Za-z']+/,&:capitalize))
end

def list_genre
	list_genres
	puts "Type the name of any listed genre to list songs in that genre".yellow
	list_genre_songs(x= gets.chomp.downcase)
end

def wrong_input(x)
	puts "#{x} is an unrecognised input. Try again with a valid command".red
	library_action_menu
end

def list_artist_songs(x)
  chosen_artist = Artist.all.detect {|artist| artist.name == x}
  chosen_artist.songs.each do |song|
    puts "#{chosen_artist.name} - #{song.name} - #{song.genre.name}".cyan
  end
end

def list_genre_songs(x)
  chosen_genre = Genre.all.detect {|genre| genre.name == x}
	chosen_genre.songs.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}".cyan
  end
end